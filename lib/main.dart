import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'l10n/generated/app_localizations.dart';
import 'core/theme/app_theme.dart';
import 'core/services/ad_service.dart';
import 'core/services/feedback_service.dart';
import 'features/main/main_shell.dart';
import 'providers/repository_providers.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // TODO: Firebase initialization (uncomment after firebase setup)
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );
  // FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;

  // AdMob 초기화
  await AdService().initialize();
  AdService().preloadAds();

  runApp(
    const ProviderScope(
      child: TriviaQuizApp(),
    ),
  );
}

class TriviaQuizApp extends ConsumerWidget {
  const TriviaQuizApp({super.key});

  static const supportedLocales = [
    Locale('en'),           // English
    Locale('ko'),           // Korean
    Locale('ja'),           // Japanese
    Locale('zh'),           // Chinese (Simplified)
    Locale('zh', 'Hant'),   // Chinese (Traditional)
    Locale('de'),           // German
    Locale('fr'),           // French
    Locale('es'),           // Spanish
    Locale('pt'),           // Portuguese
    Locale('it'),           // Italian
    Locale('ru'),           // Russian
    Locale('ar'),           // Arabic
    Locale('th'),           // Thai
    Locale('vi'),           // Vietnamese
    Locale('id'),           // Indonesian
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 테마 모드 설정 적용
    final themeModeAsync = ref.watch(themeModeProvider);
    final themeMode = themeModeAsync.valueOrNull ?? ThemeMode.system;

    // 언어 설정 적용
    final localeAsync = ref.watch(preferredLocaleProvider);
    final locale = _parseLocale(localeAsync.valueOrNull);

    // 설정 값을 FeedbackService에 동기화
    ref.listen(soundEnabledProvider, (_, next) {
      next.whenData((enabled) => FeedbackService().setSoundEnabled(enabled));
    });
    ref.listen(vibrationEnabledProvider, (_, next) {
      next.whenData((enabled) => FeedbackService().setVibrationEnabled(enabled));
    });

    return MaterialApp(
      title: 'Trivia Quiz',
      debugShowCheckedModeBanner: false,

      // Theme
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: themeMode,

      // Localization
      locale: locale,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: supportedLocales,

      home: const MainShell(),
    );
  }

  Locale? _parseLocale(String? localeString) {
    if (localeString == null || localeString.isEmpty) return null;

    final parts = localeString.split('_');
    if (parts.length == 1) {
      return Locale(parts[0]);
    } else if (parts.length >= 2) {
      return Locale(parts[0], parts[1]);
    }
    return null;
  }
}
