import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

import 'tables/quiz_history.dart';
import 'tables/user_settings.dart';
import 'tables/study_records.dart';
import 'daos/quiz_history_dao.dart';
import 'daos/user_settings_dao.dart';
import 'daos/study_record_dao.dart';

part 'app_database.g.dart';

@DriftDatabase(
  tables: [QuizHistory, UserSettings, StudyRecords],
  daos: [QuizHistoryDao, UserSettingsDao, StudyRecordDao],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  /// 테스트용 생성자
  AppDatabase.forTesting(super.e);

  @override
  int get schemaVersion => 2;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onCreate: (Migrator m) async {
        await m.createAll();
      },
      onUpgrade: (Migrator m, int from, int to) async {
        // v1 → v2: StudyRecords 테이블 추가
        if (from < 2) {
          await m.createTable(studyRecords);
        }
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
