// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get appTitle => 'مسابقة المعلومات العامة';

  @override
  String get home => 'الرئيسية';

  @override
  String get stats => 'الإحصائيات';

  @override
  String get review => 'المراجعة';

  @override
  String get settings => 'الإعدادات';

  @override
  String get quickQuiz => 'اختبار سريع';

  @override
  String get quickQuizDescription => '10 أسئلة عشوائية من جميع الفئات';

  @override
  String get categories => 'الفئات';

  @override
  String get yourStats => 'إحصائياتك';

  @override
  String get answered => 'تمت الإجابة';

  @override
  String get correct => 'صحيح';

  @override
  String get questions => 'أسئلة';

  @override
  String question(int current, int total) {
    return 'السؤال $current من $total';
  }

  @override
  String get correctAnswer => 'صحيح!';

  @override
  String get wrongAnswer => 'خطأ!';

  @override
  String theCorrectAnswerIs(String answer) {
    return 'الإجابة الصحيحة هي: $answer';
  }

  @override
  String get next => 'التالي';

  @override
  String get finish => 'إنهاء';

  @override
  String get quizComplete => 'اكتمل الاختبار!';

  @override
  String get yourScore => 'نتيجتك';

  @override
  String outOf(int correct, int total) {
    return '$correct من $total';
  }

  @override
  String get playAgain => 'العب مرة أخرى';

  @override
  String get backToHome => 'العودة للرئيسية';

  @override
  String get wrongAnswers => 'الإجابات الخاطئة';

  @override
  String get noWrongAnswers => 'لا توجد إجابات خاطئة بعد!';

  @override
  String get reviewAll => 'مراجعة الكل';

  @override
  String get start => 'ابدأ';

  @override
  String wrongCount(int count) {
    return '$count خطأ';
  }

  @override
  String get recentWrong => 'الأخطاء الأخيرة';

  @override
  String get yourAnswer => 'إجابتك';

  @override
  String get correctAnswerLabel => 'الإجابة الصحيحة';

  @override
  String hoursAgo(int hours) {
    return 'منذ $hours ساعات';
  }

  @override
  String get categoryGeography => 'الجغرافيا';

  @override
  String get categoryHistory => 'التاريخ';

  @override
  String get categoryScience => 'العلوم';

  @override
  String get categoryArts => 'الفنون والثقافة';

  @override
  String get categorySports => 'الرياضة';

  @override
  String get categoryNature => 'الطبيعة';

  @override
  String get categoryTechnology => 'التكنولوجيا';

  @override
  String get categoryFood => 'الطعام ونمط الحياة';

  @override
  String get soundEffects => 'المؤثرات الصوتية';

  @override
  String get soundEffectsDescription =>
      'تشغيل الأصوات عند الإجابات الصحيحة/الخاطئة';

  @override
  String get vibration => 'الاهتزاز';

  @override
  String get vibrationDescription => 'الاهتزاز عند التفاعل';

  @override
  String get theme => 'السمة';

  @override
  String get themeLight => 'فاتح';

  @override
  String get themeDark => 'داكن';

  @override
  String get themeSystem => 'النظام';

  @override
  String get selectTheme => 'اختر السمة';

  @override
  String get language => 'اللغة';

  @override
  String get selectLanguage => 'اختر اللغة';

  @override
  String get systemDefault => 'الافتراضي للنظام';

  @override
  String get about => 'حول';

  @override
  String get aboutDescription => 'اختبر معلوماتك بأسئلة من جميع أنحاء العالم!';

  @override
  String get resetAllData => 'إعادة تعيين جميع البيانات';

  @override
  String get resetAllDataTitle => 'إعادة تعيين جميع البيانات؟';

  @override
  String get resetAllDataMessage =>
      'سيؤدي هذا إلى حذف كل سجل الاختبارات والإعدادات. لا يمكن التراجع عن هذا الإجراء.';

  @override
  String get cancel => 'إلغاء';

  @override
  String get reset => 'إعادة تعيين';

  @override
  String get dataResetSuccess => 'تم إعادة تعيين جميع البيانات';

  @override
  String get exitQuiz => 'الخروج من الاختبار؟';

  @override
  String get progressWillBeLost => 'سيتم فقدان تقدمك.';

  @override
  String get exit => 'خروج';

  @override
  String get loadingQuestions => 'جاري تحميل الأسئلة...';

  @override
  String get timeUp => 'انتهى الوقت!';

  @override
  String get showHint => 'عرض التلميح';

  @override
  String get watchAdForHint => 'شاهد إعلاناً لرؤية التلميح';

  @override
  String get watching => 'جاري المشاهدة';

  @override
  String get loading => 'جاري التحميل...';

  @override
  String get adLoadingMessage =>
      'جاري تحميل الإعلان. يرجى المحاولة مرة أخرى قريباً.';

  @override
  String get messageOutstanding => 'رائع! أنت سيد المعلومات!';

  @override
  String get messageGreatJob => 'عمل رائع! استمر!';

  @override
  String get messageGoodEffort => 'مجهود جيد! الممارسة تصنع الكمال!';

  @override
  String get messageKeepLearning =>
      'استمر في التعلم! ستكون أفضل في المرة القادمة!';

  @override
  String get oopsSomethingWentWrong => 'عفواً! حدث خطأ ما';

  @override
  String get goBack => 'رجوع';

  @override
  String get tryAgain => 'حاول مرة أخرى';

  @override
  String get overallProgress => 'التقدم الإجمالي';

  @override
  String get categoryProgress => 'التقدم حسب الفئة';

  @override
  String get accuracy => 'الدقة';

  @override
  String get accuracyRate => 'نسبة الصحة';

  @override
  String get unique => 'فريد';

  @override
  String get unableToLoadStats => 'تعذر تحميل الإحصائيات';

  @override
  String get youreDoingGreat => 'أنت تبلي بلاءً حسناً!';

  @override
  String get leaderboardComingSoon => 'لوحة المتصدرين قريباً!';
}
