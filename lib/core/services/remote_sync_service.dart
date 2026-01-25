import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../constants/remote_config.dart';
import '../../data/models/sync_result.dart';

/// GitHub 원격 데이터 동기화 서비스
class RemoteSyncService {
  static final RemoteSyncService _instance = RemoteSyncService._internal();
  factory RemoteSyncService() => _instance;
  RemoteSyncService._internal();

  /// 현재 동기화 상태
  SyncStatus _status = SyncStatus.idle;
  SyncStatus get status => _status;

  /// 동기화 진행 중 여부
  bool get isSyncing =>
      _status == SyncStatus.checking || _status == SyncStatus.downloading;

  /// 원격 서버에서 데이터 동기화
  /// [locale] - 특정 로케일만 동기화 (null이면 기기 언어 + 영어)
  Future<SyncResult> syncFromRemote({
    bool forceUpdate = false,
    String? locale,
  }) async {
    if (isSyncing) {
      return SyncResult.failed('Sync already in progress');
    }

    try {
      _status = SyncStatus.checking;
      final prefs = await SharedPreferences.getInstance();
      final localVersion =
          prefs.getString(RemoteConfig.localVersionKey) ?? '0.0.0';

      // ─────────────────────────────────────
      // 1단계: 버전 확인 (가벼운 요청)
      // ─────────────────────────────────────
      final versionResponse = await http
          .get(Uri.parse('${RemoteConfig.baseUrl}/version.json'))
          .timeout(Duration(seconds: RemoteConfig.versionCheckTimeout));

      if (versionResponse.statusCode != 200) {
        _status = SyncStatus.failed;
        return SyncResult.failed(
          'Version check failed: HTTP ${versionResponse.statusCode}',
        );
      }

      final versionData =
          jsonDecode(versionResponse.body) as Map<String, dynamic>;
      final versionInfo = VersionInfo.fromJson(versionData);
      final remoteVersion = versionInfo.version;

      debugPrint(
          '[RemoteSync] Local: $localVersion, Remote: $remoteVersion');

      // ─────────────────────────────────────
      // 2단계: 버전 비교
      // ─────────────────────────────────────
      if (!forceUpdate && _compareVersions(remoteVersion, localVersion) <= 0) {
        _status = SyncStatus.upToDate;
        debugPrint('[RemoteSync] Already up to date');
        return SyncResult.upToDate();
      }

      // ─────────────────────────────────────
      // 3단계: 새 데이터 다운로드 (현재 언어 + 영어만)
      // ─────────────────────────────────────
      _status = SyncStatus.downloading;
      int downloadedFiles = 0;
      int totalBytes = 0;

      // 다운로드할 로케일 결정 (지정된 언어 또는 기기 언어 + 영어 폴백)
      final localesToSync = locale != null
          ? _normalizeLocales([locale])
          : _getLocalesToSync();
      debugPrint('[RemoteSync] Syncing locales: $localesToSync');

      // 각 로케일별 병렬 다운로드
      for (final locale in localesToSync) {
        final results = await Future.wait(
          RemoteConfig.categories.map((category) async {
            try {
              final dataUrl =
                  '${RemoteConfig.baseUrl}/questions/$locale/$category.json';
              final response = await http.get(Uri.parse(dataUrl)).timeout(
                    Duration(seconds: RemoteConfig.dataDownloadTimeout),
                  );

              if (response.statusCode == 200) {
                // 유효성 검사
                final data = jsonDecode(response.body);
                if (data is! Map<String, dynamic>) {
                  return null;
                }

                // 로컬 저장
                final key =
                    '${RemoteConfig.localDataPrefix}${locale}_$category';
                await prefs.setString(key, response.body);

                return response.bodyBytes.length;
              }
            } catch (e) {
              debugPrint('[RemoteSync] Error: $locale/$category - $e');
            }
            return null;
          }),
        );

        // 결과 집계
        for (final bytes in results) {
          if (bytes != null) {
            downloadedFiles++;
            totalBytes += bytes;
          }
        }
        debugPrint('[RemoteSync] Downloaded: $locale (${results.where((r) => r != null).length} files)');
      }

      // ─────────────────────────────────────
      // 4단계: 버전 저장
      // ─────────────────────────────────────
      if (downloadedFiles > 0) {
        await prefs.setString(RemoteConfig.localVersionKey, remoteVersion);
        _status = SyncStatus.completed;

        debugPrint(
            '[RemoteSync] Completed: $downloadedFiles files, $totalBytes bytes');

        return SyncResult.completed(
          version: remoteVersion,
          files: downloadedFiles,
          bytes: totalBytes,
        );
      } else {
        _status = SyncStatus.failed;
        return SyncResult.failed('No files downloaded');
      }
    } on TimeoutException {
      _status = SyncStatus.failed;
      return SyncResult.failed('Connection timeout');
    } on SocketException {
      _status = SyncStatus.failed;
      return SyncResult.failed('No internet connection');
    } on http.ClientException catch (e) {
      _status = SyncStatus.failed;
      return SyncResult.failed('Network error: ${e.message}');
    } catch (e) {
      _status = SyncStatus.failed;
      return SyncResult.failed(e.toString());
    }
  }

  /// 로컬에 저장된 데이터 가져오기
  Future<String?> getLocalData(String locale, String category) async {
    final prefs = await SharedPreferences.getInstance();
    final key = '${RemoteConfig.localDataPrefix}${locale}_$category';
    return prefs.getString(key);
  }

  /// 로컬에 데이터가 있는지 확인
  Future<bool> hasLocalData(String locale, String category) async {
    final data = await getLocalData(locale, category);
    return data != null;
  }

  /// 현재 로컬 버전 가져오기
  Future<String> getLocalVersion() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(RemoteConfig.localVersionKey) ?? '0.0.0';
  }

  /// 모든 로컬 데이터 삭제
  Future<void> clearLocalData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(RemoteConfig.localVersionKey);

    for (final locale in RemoteConfig.locales) {
      for (final category in RemoteConfig.categories) {
        final key = '${RemoteConfig.localDataPrefix}${locale}_$category';
        await prefs.remove(key);
      }
    }

    debugPrint('[RemoteSync] Local data cleared');
  }

  /// 특정 로케일 데이터만 동기화 (언어 변경 시 호출)
  Future<SyncResult> syncLocale(String locale) async {
    final normalizedLocales = _normalizeLocales([locale]);
    debugPrint('[RemoteSync] Syncing locale on demand: $normalizedLocales');

    final prefs = await SharedPreferences.getInstance();
    int downloadedFiles = 0;
    int totalBytes = 0;

    for (final loc in normalizedLocales) {
      // 이미 동기화된 로케일인지 확인
      final testKey = '${RemoteConfig.localDataPrefix}${loc}_geography';
      if (prefs.containsKey(testKey)) {
        debugPrint('[RemoteSync] Locale $loc already synced, skipping');
        continue;
      }

      final results = await Future.wait(
        RemoteConfig.categories.map((category) async {
          try {
            final dataUrl =
                '${RemoteConfig.baseUrl}/questions/$loc/$category.json';
            final response = await http.get(Uri.parse(dataUrl)).timeout(
                  Duration(seconds: RemoteConfig.dataDownloadTimeout),
                );

            if (response.statusCode == 200) {
              final data = jsonDecode(response.body);
              if (data is! Map<String, dynamic>) return null;

              final key = '${RemoteConfig.localDataPrefix}${loc}_$category';
              await prefs.setString(key, response.body);
              return response.bodyBytes.length;
            }
          } catch (e) {
            debugPrint('[RemoteSync] Error: $loc/$category - $e');
          }
          return null;
        }),
      );

      for (final bytes in results) {
        if (bytes != null) {
          downloadedFiles++;
          totalBytes += bytes;
        }
      }
    }

    if (downloadedFiles > 0) {
      debugPrint('[RemoteSync] On-demand sync completed: $downloadedFiles files');
      return SyncResult.completed(
        version: await getLocalVersion(),
        files: downloadedFiles,
        bytes: totalBytes,
      );
    }

    return SyncResult.upToDate();
  }

  /// 로케일 문자열 정규화 (en_US -> en, zh_Hant -> zh-Hant)
  List<String> _normalizeLocales(List<String> locales) {
    final result = <String>{'en'}; // 영어는 항상 포함

    for (final locale in locales) {
      final parts = locale.replaceAll('-', '_').split('_');
      final langCode = parts[0];
      final scriptOrCountry = parts.length > 1 ? parts[1] : null;

      if (langCode == 'zh') {
        if (scriptOrCountry == 'Hant' || scriptOrCountry == 'TW' || scriptOrCountry == 'HK') {
          result.add('zh-Hant');
        } else {
          result.add('zh');
        }
      } else if (RemoteConfig.locales.contains(langCode)) {
        result.add(langCode);
      }
    }

    return result.toList();
  }

  /// 동기화할 로케일 목록 반환 (기기 언어 + 영어)
  List<String> _getLocalesToSync() {
    // 기기 로케일 추가
    // ignore: deprecated_member_use
    final deviceLocale = WidgetsBinding.instance.platformDispatcher.locale;
    return _normalizeLocales([deviceLocale.toString()]);
  }

  /// Semantic Versioning 비교
  /// 반환: 양수(v1 > v2), 0(같음), 음수(v1 < v2)
  int _compareVersions(String v1, String v2) {
    final parts1 = v1.split('.').map((e) => int.tryParse(e) ?? 0).toList();
    final parts2 = v2.split('.').map((e) => int.tryParse(e) ?? 0).toList();

    for (int i = 0; i < 3; i++) {
      final p1 = i < parts1.length ? parts1[i] : 0;
      final p2 = i < parts2.length ? parts2[i] : 0;
      if (p1 != p2) return p1.compareTo(p2);
    }
    return 0;
  }
}
