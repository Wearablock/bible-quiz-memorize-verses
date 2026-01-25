import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/constants/app_urls.dart';
import '../../../core/services/feedback_service.dart';
import '../../../core/services/remote_sync_service.dart';
import '../../../providers/repository_providers.dart';
import '../../../l10n/generated/app_localizations.dart';
import '../../../main.dart';
import 'webview_screen.dart';
import 'widgets/premium_tile.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final soundEnabled = ref.watch(soundEnabledProvider);
    final vibrationEnabled = ref.watch(vibrationEnabledProvider);
    final themeMode = ref.watch(themeModeProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.settings),
      ),
      body: ListView(
        children: [
          // Premium Section
          ListTile(
            title: Text(
              l10n.premium,
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
          const PremiumTile(),

          const Divider(),

          // Sound
          soundEnabled.when(
            data: (enabled) => SwitchListTile(
              title: Text(l10n.soundEffects),
              subtitle: Text(l10n.soundEffectsDescription),
              secondary: const Icon(Icons.volume_up),
              value: enabled,
              onChanged: (value) {
                ref.read(settingsRepositoryProvider).setSoundEnabled(value);
                FeedbackService().setSoundEnabled(value);
              },
            ),
            loading: () => ListTile(
              title: Text(l10n.soundEffects),
              trailing: const SizedBox(
                width: 24,
                height: 24,
                child: CircularProgressIndicator(strokeWidth: 2),
              ),
            ),
            error: (_, __) => const SizedBox.shrink(),
          ),

          // Vibration
          vibrationEnabled.when(
            data: (enabled) => SwitchListTile(
              title: Text(l10n.vibration),
              subtitle: Text(l10n.vibrationDescription),
              secondary: const Icon(Icons.vibration),
              value: enabled,
              onChanged: (value) {
                ref.read(settingsRepositoryProvider).setVibrationEnabled(value);
                FeedbackService().setVibrationEnabled(value);
              },
            ),
            loading: () => ListTile(
              title: Text(l10n.vibration),
              trailing: const SizedBox(
                width: 24,
                height: 24,
                child: CircularProgressIndicator(strokeWidth: 2),
              ),
            ),
            error: (_, __) => const SizedBox.shrink(),
          ),

          const Divider(),

          // Theme
          themeMode.when(
            data: (mode) => ListTile(
              leading: const Icon(Icons.palette),
              title: Text(l10n.theme),
              subtitle: Text(_getThemeModeName(mode, l10n)),
              trailing: const Icon(Icons.chevron_right),
              onTap: () => _showThemeDialog(context, ref, mode, l10n),
            ),
            loading: () => ListTile(
              title: Text(l10n.theme),
              trailing: const SizedBox(
                width: 24,
                height: 24,
                child: CircularProgressIndicator(strokeWidth: 2),
              ),
            ),
            error: (_, __) => const SizedBox.shrink(),
          ),

          // Language
          Builder(
            builder: (context) {
              final currentLocale = Localizations.localeOf(context);
              return ListTile(
                leading: const Icon(Icons.language),
                title: Text(l10n.language),
                subtitle: Text(_getLanguageName(currentLocale)),
                trailing: const Icon(Icons.chevron_right),
                onTap: () => _showLanguageDialog(context, ref, currentLocale, l10n),
              );
            },
          ),

          const Divider(),

          // Terms of Service
          ListTile(
            leading: const Icon(Icons.description_outlined),
            title: Text(l10n.termsOfService),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => _openWebView(context, l10n.termsOfService, AppUrls.termsUrl),
          ),

          // Privacy Policy
          ListTile(
            leading: const Icon(Icons.privacy_tip_outlined),
            title: Text(l10n.privacyPolicy),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => _openWebView(context, l10n.privacyPolicy, AppUrls.privacyUrl),
          ),

          // Support
          ListTile(
            leading: const Icon(Icons.help_outline),
            title: Text(l10n.support),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => _openWebView(context, l10n.support, AppUrls.supportUrl),
          ),

          const Divider(),

          // About
          ListTile(
            leading: const Icon(Icons.info_outline),
            title: Text(l10n.about),
            onTap: () => _showAboutDialog(context, l10n),
          ),

          // Reset
          ListTile(
            leading: Icon(Icons.delete_outline, color: Colors.red.shade400),
            title: Text(
              l10n.resetAllData,
              style: TextStyle(color: Colors.red.shade400),
            ),
            onTap: () => _showResetDialog(context, ref, l10n),
          ),
        ],
      ),
    );
  }

  String _getThemeModeName(ThemeMode mode, AppLocalizations l10n) {
    switch (mode) {
      case ThemeMode.light:
        return l10n.themeLight;
      case ThemeMode.dark:
        return l10n.themeDark;
      case ThemeMode.system:
        return l10n.themeSystem;
    }
  }

  void _showThemeDialog(
      BuildContext context, WidgetRef ref, ThemeMode current, AppLocalizations l10n) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(l10n.selectTheme),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: ThemeMode.values.map((mode) {
            return RadioListTile<ThemeMode>(
              title: Text(_getThemeModeName(mode, l10n)),
              value: mode,
              groupValue: current,
              onChanged: (value) {
                if (value != null) {
                  ref.read(settingsRepositoryProvider).setThemeMode(value);
                  Navigator.pop(context);
                }
              },
            );
          }).toList(),
        ),
      ),
    );
  }

  String _getLanguageName(Locale locale) {
    final languageNames = {
      'en': 'English',
      'ko': '한국어',
      'ja': '日本語',
      'zh': '简体中文',
      'zh_Hant': '繁體中文',
      'de': 'Deutsch',
      'fr': 'Français',
      'es': 'Español',
      'pt': 'Português',
      'it': 'Italiano',
      'ru': 'Русский',
      'ar': 'العربية',
      'th': 'ไทย',
      'vi': 'Tiếng Việt',
      'id': 'Bahasa Indonesia',
    };

    final key = locale.countryCode != null && locale.countryCode!.isNotEmpty
        ? '${locale.languageCode}_${locale.countryCode}'
        : locale.languageCode;
    return languageNames[key] ?? locale.toLanguageTag();
  }

  void _showLanguageDialog(BuildContext context, WidgetRef ref, Locale currentLocale, AppLocalizations l10n) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(l10n.selectLanguage),
        content: SizedBox(
          width: double.maxFinite,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: TriviaQuizApp.supportedLocales.length + 1,
            itemBuilder: (context, index) {
              // System default option
              if (index == 0) {
                return RadioListTile<String?>(
                  title: Text(l10n.systemDefault),
                  value: null,
                  groupValue: _getCurrentLocaleString(currentLocale, ref),
                  onChanged: (value) {
                    ref.read(settingsRepositoryProvider).setPreferredLocale(null);
                    Navigator.pop(context);
                  },
                );
              }

              final locale = TriviaQuizApp.supportedLocales[index - 1];
              final localeString = locale.countryCode != null && locale.countryCode!.isNotEmpty
                  ? '${locale.languageCode}_${locale.countryCode}'
                  : locale.languageCode;

              return RadioListTile<String?>(
                title: Text(_getLanguageName(locale)),
                value: localeString,
                groupValue: _getCurrentLocaleString(currentLocale, ref),
                onChanged: (value) {
                  ref.read(settingsRepositoryProvider).setPreferredLocale(value);
                  Navigator.pop(context);
                  // 선택한 언어의 퀴즈 데이터 동기화 (백그라운드)
                  if (value != null) {
                    RemoteSyncService().syncLocale(value).then((result) {
                      debugPrint('[Settings] Locale sync result: ${result.status.name}');
                    });
                  }
                },
              );
            },
          ),
        ),
      ),
    );
  }

  String? _getCurrentLocaleString(Locale currentLocale, WidgetRef ref) {
    final preferredAsync = ref.read(preferredLocaleProvider);
    return preferredAsync.valueOrNull;
  }

  void _openWebView(BuildContext context, String title, String url) {
    final locale = Localizations.localeOf(context);
    // Map locale to HTML lang code
    String htmlLangCode;
    if (locale.scriptCode == 'Hant' || locale.countryCode == 'TW') {
      htmlLangCode = 'zh-TW';
    } else {
      htmlLangCode = locale.languageCode;
    }
    final urlWithLang = '$url?lang=$htmlLangCode';
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => WebViewScreen(title: title, url: urlWithLang),
      ),
    );
  }

  void _showAboutDialog(BuildContext context, AppLocalizations l10n) {
    showAboutDialog(
      context: context,
      applicationName: l10n.appTitle,
      applicationVersion: '1.0.0',
      applicationIcon: const Icon(Icons.quiz, size: 48),
      children: [
        Text(l10n.aboutDescription),
      ],
    );
  }

  void _showResetDialog(BuildContext context, WidgetRef ref, AppLocalizations l10n) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(l10n.resetAllDataTitle),
        content: Text(l10n.resetAllDataMessage),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(l10n.cancel),
          ),
          TextButton(
            onPressed: () async {
              await ref.read(quizHistoryRepositoryProvider).clearAllHistory();
              await ref.read(settingsRepositoryProvider).resetAllSettings();
              if (context.mounted) {
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(l10n.dataResetSuccess)),
                );
              }
            },
            style: TextButton.styleFrom(foregroundColor: Colors.red),
            child: Text(l10n.reset),
          ),
        ],
      ),
    );
  }
}
