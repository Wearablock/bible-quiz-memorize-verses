/// 동기화 상태
enum SyncStatus {
  idle, // 대기 중
  checking, // 버전 확인 중
  downloading, // 다운로드 중
  completed, // 동기화 완료
  failed, // 실패
  upToDate, // 이미 최신
}

/// 동기화 결과
class SyncResult {
  final SyncStatus status;
  final String? newVersion;
  final String? errorMessage;
  final int? downloadedFiles;
  final int? downloadedBytes;

  const SyncResult({
    required this.status,
    this.newVersion,
    this.errorMessage,
    this.downloadedFiles,
    this.downloadedBytes,
  });

  bool get isSuccess =>
      status == SyncStatus.completed || status == SyncStatus.upToDate;

  bool get hasUpdate => status == SyncStatus.completed;

  @override
  String toString() =>
      'SyncResult($status, v$newVersion, files: $downloadedFiles, $errorMessage)';

  /// 팩토리 생성자들
  factory SyncResult.upToDate() => const SyncResult(status: SyncStatus.upToDate);

  factory SyncResult.failed(String message) => SyncResult(
        status: SyncStatus.failed,
        errorMessage: message,
      );

  factory SyncResult.completed({
    required String version,
    int? files,
    int? bytes,
  }) =>
      SyncResult(
        status: SyncStatus.completed,
        newVersion: version,
        downloadedFiles: files,
        downloadedBytes: bytes,
      );
}

/// 버전 정보 모델
class VersionInfo {
  final String version;
  final String? minAppVersion;
  final String releaseDate;
  final String? changelog;
  final Map<String, FileInfo>? dataFiles;

  const VersionInfo({
    required this.version,
    this.minAppVersion,
    required this.releaseDate,
    this.changelog,
    this.dataFiles,
  });

  factory VersionInfo.fromJson(Map<String, dynamic> json) {
    Map<String, FileInfo>? files;
    if (json['dataFiles'] != null) {
      files = (json['dataFiles'] as Map<String, dynamic>).map(
        (key, value) => MapEntry(key, FileInfo.fromJson(value)),
      );
    }

    return VersionInfo(
      version: json['version'] as String,
      minAppVersion: json['minAppVersion'] as String?,
      releaseDate: json['releaseDate'] as String,
      changelog: json['changelog'] as String?,
      dataFiles: files,
    );
  }

  Map<String, dynamic> toJson() => {
        'version': version,
        if (minAppVersion != null) 'minAppVersion': minAppVersion,
        'releaseDate': releaseDate,
        if (changelog != null) 'changelog': changelog,
        if (dataFiles != null)
          'dataFiles': dataFiles!.map((k, v) => MapEntry(k, v.toJson())),
      };
}

/// 파일 정보 모델
class FileInfo {
  final String? hash;
  final int? size;

  const FileInfo({this.hash, this.size});

  factory FileInfo.fromJson(Map<String, dynamic> json) => FileInfo(
        hash: json['hash'] as String?,
        size: json['size'] as int?,
      );

  Map<String, dynamic> toJson() => {
        if (hash != null) 'hash': hash,
        if (size != null) 'size': size,
      };
}
