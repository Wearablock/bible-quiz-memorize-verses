import 'package:drift/drift.dart';

/// 사용자 설정 테이블
class UserSettings extends Table {
  /// 설정 키 (Primary Key)
  TextColumn get key => text()();

  /// 설정 값 (JSON 문자열 가능)
  TextColumn get value => text()();

  /// 수정 시간
  DateTimeColumn get updatedAt => dateTime()();

  @override
  Set<Column> get primaryKey => {key};
}
