import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

import 'tables/quiz_history.dart';
import 'tables/user_settings.dart';
import 'daos/quiz_history_dao.dart';
import 'daos/user_settings_dao.dart';

part 'app_database.g.dart';

@DriftDatabase(
  tables: [QuizHistory, UserSettings],
  daos: [QuizHistoryDao, UserSettingsDao],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  /// 테스트용 생성자
  AppDatabase.forTesting(super.e);

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onCreate: (Migrator m) async {
        await m.createAll();
      },
      onUpgrade: (Migrator m, int from, int to) async {
        // 향후 마이그레이션 로직
      },
      beforeOpen: (details) async {
        // 외래 키 활성화
        await customStatement('PRAGMA foreign_keys = ON');
      },
    );
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'trivia_quiz.sqlite'));
    return NativeDatabase.createInBackground(file);
  });
}
