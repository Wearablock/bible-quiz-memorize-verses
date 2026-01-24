import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/database/app_database.dart';
import '../data/database/daos/quiz_history_dao.dart';
import '../data/database/daos/user_settings_dao.dart';

/// 데이터베이스 인스턴스
final databaseProvider = Provider<AppDatabase>((ref) {
  final db = AppDatabase();
  ref.onDispose(() => db.close());
  return db;
});

/// QuizHistory DAO
final quizHistoryDaoProvider = Provider<QuizHistoryDao>((ref) {
  return ref.watch(databaseProvider).quizHistoryDao;
});

/// UserSettings DAO
final userSettingsDaoProvider = Provider<UserSettingsDao>((ref) {
  return ref.watch(databaseProvider).userSettingsDao;
});

/// 전체 통계 스트림
final overallStatsProvider = StreamProvider<OverallStats>((ref) {
  return ref.watch(quizHistoryDaoProvider).watchOverallStats();
});
