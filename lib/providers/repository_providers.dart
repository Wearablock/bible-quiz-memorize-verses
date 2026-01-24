import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/models/category.dart';
import '../data/repositories/category_repository.dart';
import '../data/repositories/question_repository.dart';
import '../data/repositories/quiz_history_repository.dart';
import '../data/repositories/settings_repository.dart';
import 'database_providers.dart';

/// CategoryRepository Provider
final categoryRepositoryProvider = Provider<CategoryRepository>((ref) {
  return CategoryRepository();
});

/// QuestionRepository Provider
final questionRepositoryProvider = Provider<QuestionRepository>((ref) {
  return QuestionRepository();
});

/// QuizHistoryRepository Provider
final quizHistoryRepositoryProvider = Provider<QuizHistoryRepository>((ref) {
  final dao = ref.watch(quizHistoryDaoProvider);
  return QuizHistoryRepository(dao);
});

/// SettingsRepository Provider
final settingsRepositoryProvider = Provider<SettingsRepository>((ref) {
  final dao = ref.watch(userSettingsDaoProvider);
  return SettingsRepository(dao);
});

// === Derived Providers ===

/// 카테고리 목록 Provider
final categoriesProvider = FutureProvider<List<Category>>((ref) {
  final repository = ref.watch(categoryRepositoryProvider);
  return repository.getCategories();
});

/// 테마 모드 Provider
final themeModeProvider = StreamProvider<ThemeMode>((ref) {
  final repository = ref.watch(settingsRepositoryProvider);
  return repository.watchThemeMode();
});

/// 효과음 설정 Provider
final soundEnabledProvider = StreamProvider<bool>((ref) {
  final repository = ref.watch(settingsRepositoryProvider);
  return repository.watchSoundEnabled();
});

/// 진동 설정 Provider
final vibrationEnabledProvider = StreamProvider<bool>((ref) {
  final repository = ref.watch(settingsRepositoryProvider);
  return repository.watchVibrationEnabled();
});

/// 기본 문제 수 Provider
final defaultQuestionCountProvider = StreamProvider<int>((ref) {
  final repository = ref.watch(settingsRepositoryProvider);
  return repository.watchDefaultQuestionCount();
});
