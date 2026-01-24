import 'package:drift/drift.dart';
import '../app_database.dart';
import '../tables/user_settings.dart';

part 'user_settings_dao.g.dart';

@DriftAccessor(tables: [UserSettings])
class UserSettingsDao extends DatabaseAccessor<AppDatabase>
    with _$UserSettingsDaoMixin {
  UserSettingsDao(super.db);

  /// 설정 값 가져오기
  Future<String?> getValue(String key) async {
    final result = await (select(userSettings)
          ..where((t) => t.key.equals(key)))
        .getSingleOrNull();
    return result?.value;
  }

  /// 설정 값 저장
  Future<void> setValue(String key, String value) async {
    await into(userSettings).insertOnConflictUpdate(
      UserSettingsCompanion.insert(
        key: key,
        value: value,
        updatedAt: DateTime.now(),
      ),
    );
  }

  /// 설정 값 삭제
  Future<int> deleteValue(String key) {
    return (delete(userSettings)..where((t) => t.key.equals(key))).go();
  }

  /// bool 값 가져오기
  Future<bool> getBool(String key, {bool defaultValue = false}) async {
    final value = await getValue(key);
    if (value == null) return defaultValue;
    return value == 'true';
  }

  /// bool 값 저장
  Future<void> setBool(String key, bool value) {
    return setValue(key, value.toString());
  }

  /// int 값 가져오기
  Future<int> getInt(String key, {int defaultValue = 0}) async {
    final value = await getValue(key);
    if (value == null) return defaultValue;
    return int.tryParse(value) ?? defaultValue;
  }

  /// int 값 저장
  Future<void> setInt(String key, int value) {
    return setValue(key, value.toString());
  }

  /// 모든 설정 가져오기
  Future<Map<String, String>> getAllSettings() async {
    final results = await select(userSettings).get();
    return {for (final r in results) r.key: r.value};
  }

  /// 모든 설정 초기화
  Future<int> clearAllSettings() {
    return delete(userSettings).go();
  }

  /// 특정 설정 값 스트림
  Stream<String?> watchValue(String key) {
    return (select(userSettings)..where((t) => t.key.equals(key)))
        .watchSingleOrNull()
        .map((result) => result?.value);
  }
}
