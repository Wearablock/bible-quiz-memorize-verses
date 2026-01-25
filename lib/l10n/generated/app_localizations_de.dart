// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for German (`de`).
class AppLocalizationsDe extends AppLocalizations {
  AppLocalizationsDe([String locale = 'de']) : super(locale);

  @override
  String get appTitle => 'Wissensquiz';

  @override
  String get home => 'Startseite';

  @override
  String get stats => 'Statistik';

  @override
  String get review => 'Überprüfung';

  @override
  String get settings => 'Einstellungen';

  @override
  String get quickQuiz => 'Schnelles Quiz';

  @override
  String get quickQuizDescription => '10 zufällige Fragen aus allen Kategorien';

  @override
  String get categories => 'Kategorien';

  @override
  String get yourStats => 'Deine Statistik';

  @override
  String get answered => 'Beantwortet';

  @override
  String get correct => 'Richtig';

  @override
  String get questions => 'Fragen';

  @override
  String question(int current, int total) {
    return 'Frage $current von $total';
  }

  @override
  String get correctAnswer => 'Richtig!';

  @override
  String get wrongAnswer => 'Falsch!';

  @override
  String theCorrectAnswerIs(String answer) {
    return 'Die richtige Antwort ist: $answer';
  }

  @override
  String get next => 'Weiter';

  @override
  String get finish => 'Beenden';

  @override
  String get quizComplete => 'Quiz abgeschlossen!';

  @override
  String get yourScore => 'Dein Ergebnis';

  @override
  String outOf(int correct, int total) {
    return '$correct von $total';
  }

  @override
  String get playAgain => 'Nochmal spielen';

  @override
  String get backToHome => 'Zurück zur Startseite';

  @override
  String get wrongAnswers => 'Falsche Antworten';

  @override
  String get noWrongAnswers => 'Noch keine falschen Antworten!';

  @override
  String get reviewAll => 'Alle überprüfen';

  @override
  String get start => 'Start';

  @override
  String wrongCount(int count) {
    return '$count falsch';
  }

  @override
  String get recentWrong => 'Kürzlich falsch';

  @override
  String get yourAnswer => 'Deine Antwort';

  @override
  String get correctAnswerLabel => 'Richtige Antwort';

  @override
  String hoursAgo(int hours) {
    return 'vor $hours Stunden';
  }

  @override
  String get categoryGeography => 'Geographie';

  @override
  String get categoryHistory => 'Geschichte';

  @override
  String get categoryScience => 'Wissenschaft';

  @override
  String get categoryArts => 'Kunst & Kultur';

  @override
  String get categorySports => 'Sport';

  @override
  String get categoryNature => 'Natur';

  @override
  String get categoryTechnology => 'Technologie';

  @override
  String get categoryFood => 'Essen & Lifestyle';

  @override
  String get soundEffects => 'Soundeffekte';

  @override
  String get soundEffectsDescription =>
      'Töne bei richtigen/falschen Antworten abspielen';

  @override
  String get vibration => 'Vibration';

  @override
  String get vibrationDescription => 'Bei Feedback vibrieren';

  @override
  String get theme => 'Design';

  @override
  String get themeLight => 'Hell';

  @override
  String get themeDark => 'Dunkel';

  @override
  String get themeSystem => 'System';

  @override
  String get selectTheme => 'Design auswählen';

  @override
  String get language => 'Sprache';

  @override
  String get selectLanguage => 'Sprache auswählen';

  @override
  String get systemDefault => 'Systemstandard';

  @override
  String get about => 'Über';

  @override
  String get aboutDescription =>
      'Testen Sie Ihr Wissen mit Fragen aus aller Welt!';

  @override
  String get resetAllData => 'Alle Daten zurücksetzen';

  @override
  String get resetAllDataTitle => 'Alle Daten zurücksetzen?';

  @override
  String get resetAllDataMessage =>
      'Dies löscht Ihren gesamten Quiz-Verlauf und Einstellungen. Diese Aktion kann nicht rückgängig gemacht werden.';

  @override
  String get cancel => 'Abbrechen';

  @override
  String get reset => 'Zurücksetzen';

  @override
  String get dataResetSuccess => 'Alle Daten wurden zurückgesetzt';

  @override
  String get exitQuiz => 'Quiz beenden?';

  @override
  String get progressWillBeLost => 'Ihr Fortschritt geht verloren.';

  @override
  String get exit => 'Beenden';

  @override
  String get loadingQuestions => 'Fragen werden geladen...';

  @override
  String get timeUp => 'Zeit abgelaufen!';

  @override
  String get showHint => 'Hinweis anzeigen';

  @override
  String get watchAdForHint => 'Werbung ansehen für Hinweis';

  @override
  String get watching => 'Ansehen';

  @override
  String get loading => 'Laden...';

  @override
  String get adLoadingMessage =>
      'Werbung wird geladen. Bitte versuchen Sie es gleich erneut.';

  @override
  String get messageOutstanding => 'Hervorragend! Sie sind ein Trivia-Meister!';

  @override
  String get messageGreatJob => 'Gut gemacht! Weiter so!';

  @override
  String get messageGoodEffort => 'Guter Einsatz! Übung macht den Meister!';

  @override
  String get messageKeepLearning =>
      'Lernen Sie weiter! Beim nächsten Mal wird es besser!';

  @override
  String get oopsSomethingWentWrong => 'Hoppla! Etwas ist schiefgelaufen';

  @override
  String get goBack => 'Zurück';

  @override
  String get tryAgain => 'Erneut versuchen';

  @override
  String get overallProgress => 'Gesamtfortschritt';

  @override
  String get categoryProgress => 'Kategoriefortschritt';

  @override
  String get accuracy => 'Genauigkeit';

  @override
  String get accuracyRate => 'Erfolgsquote';

  @override
  String get unique => 'Einzigartig';

  @override
  String get unableToLoadStats => 'Statistiken können nicht geladen werden';

  @override
  String get youreDoingGreat => 'Sie machen das großartig!';

  @override
  String get leaderboardComingSoon => 'Bestenliste kommt bald!';

  @override
  String get termsOfService => 'Nutzungsbedingungen';

  @override
  String get privacyPolicy => 'Datenschutzrichtlinie';

  @override
  String get support => 'Support';

  @override
  String get premium => 'Premium';

  @override
  String get removeAds => 'Werbung entfernen';

  @override
  String get premiumActivated => 'Premium ist aktiviert';

  @override
  String get purchase => 'Kaufen';

  @override
  String get restorePurchases => 'Käufe wiederherstellen';

  @override
  String get purchaseFailed => 'Kauf fehlgeschlagen';

  @override
  String get purchasesRestored => 'Käufe wiederhergestellt';

  @override
  String get productNotAvailable => 'Produkt nicht verfügbar';
}
