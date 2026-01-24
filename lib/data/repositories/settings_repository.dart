import 'package:flutter/material.dart';
import '../database/daos/user_settings_dao.dart';

/// 설정 키 상수
class SettingsKeys {
  static const soundEnabled = 'sound_enabled';
  static const vibrationEnabled = 'vibration_enabled';
  static const adsRemoved = 'ads_removed';
  static const premiumPurchased = 'premium_purchased';
  static const preferredLocale = 'preferred_locale';
  static const themeMode = 'theme_mode';
  static const defaultQuestionCount = 'default_question_count';

  SettingsKeys._();
}

class SettingsRepository {
  final UserSettingsDao _dao;

  SettingsRepository(this._dao);

  // === Sound ===

  Future<bool> getSoundEnabled() {
    return _dao.getBool(SettingsKeys.soundEnabled, defaultValue: true);
  }

  Future<void> setSoundEnabled(bool value) {
    return _dao.setBool(SettingsKeys.soundEnabled, value);
  }

  Stream<bool> watchSoundEnabled() {
    return _dao.watchValue(SettingsKeys.soundEnabled).map(
          (value) => value == null ? true : value == 'true',
        );
  }

  // === Vibration ===

  Future<bool> getVibrationEnabled() {
    return _dao.getBool(SettingsKeys.vibrationEnabled, defaultValue: true);
  }

  Future<void> setVibrationEnabled(bool value) {
    return _dao.setBool(SettingsKeys.vibrationEnabled, value);
  }

  Stream<bool> watchVibrationEnabled() {
    return _dao.watchValue(SettingsKeys.vibrationEnabled).map(
          (value) => value == null ? true : value == 'true',
        );
  }

  // === Ads Removed ===

  Future<bool> getAdsRemoved() {
    return _dao.getBool(SettingsKeys.adsRemoved, defaultValue: false);
  }

  Future<void> setAdsRemoved(bool value) {
    return _dao.setBool(SettingsKeys.adsRemoved, value);
  }

  // === Premium ===

  Future<bool> getPremiumPurchased() {
    return _dao.getBool(SettingsKeys.premiumPurchased, defaultValue: false);
  }

  Future<void> setPremiumPurchased(bool value) {
    return _dao.setBool(SettingsKeys.premiumPurchased, value);
  }

  // === Locale ===

  Future<String?> getPreferredLocale() {
    return _dao.getValue(SettingsKeys.preferredLocale);
  }

  Future<void> setPreferredLocale(String? locale) async {
    if (locale == null) {
      await _dao.deleteValue(SettingsKeys.preferredLocale);
    } else {
      await _dao.setValue(SettingsKeys.preferredLocale, locale);
    }
  }

  Stream<String?> watchPreferredLocale() {
    return _dao.watchValue(SettingsKeys.preferredLocale);
  }

  // === Theme Mode ===

  Future<ThemeMode> getThemeMode() async {
    final value = await _dao.getValue(SettingsKeys.themeMode);
    return _parseThemeMode(value);
  }

  Future<void> setThemeMode(ThemeMode mode) {
    return _dao.setValue(SettingsKeys.themeMode, mode.name);
  }

  Stream<ThemeMode> watchThemeMode() {
    return _dao.watchValue(SettingsKeys.themeMode).map(_parseThemeMode);
  }

  ThemeMode _parseThemeMode(String? value) {
    switch (value) {
      case 'light':
        return ThemeMode.light;
      case 'dark':
        return ThemeMode.dark;
      default:
        return ThemeMode.system;
    }
  }

  // === Question Count ===

  Future<int> getDefaultQuestionCount() {
    return _dao.getInt(SettingsKeys.defaultQuestionCount, defaultValue: 10);
  }

  Future<void> setDefaultQuestionCount(int count) {
    return _dao.setInt(SettingsKeys.defaultQuestionCount, count);
  }

  Stream<int> watchDefaultQuestionCount() {
    return _dao.watchValue(SettingsKeys.defaultQuestionCount).map(
          (value) => value == null ? 10 : int.tryParse(value) ?? 10,
        );
  }

  // === Utility ===

  /// 모든 설정 초기화
  Future<void> resetAllSettings() {
    return _dao.clearAllSettings();
  }

  /// 모든 설정 가져오기 (디버그용)
  Future<Map<String, String>> getAllSettings() {
    return _dao.getAllSettings();
  }
}
