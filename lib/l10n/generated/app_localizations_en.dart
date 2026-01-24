// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Trivia Quiz';

  @override
  String get home => 'Home';

  @override
  String get stats => 'Stats';

  @override
  String get review => 'Review';

  @override
  String get settings => 'Settings';

  @override
  String get quickQuiz => 'Quick Quiz';

  @override
  String get quickQuizDescription => '10 random questions from all categories';

  @override
  String get categories => 'Categories';

  @override
  String get yourStats => 'Your Stats';

  @override
  String get answered => 'Answered';

  @override
  String get correct => 'Correct';

  @override
  String get questions => 'questions';

  @override
  String question(int current, int total) {
    return 'Question $current of $total';
  }

  @override
  String get correctAnswer => 'Correct!';

  @override
  String get wrongAnswer => 'Wrong!';

  @override
  String theCorrectAnswerIs(String answer) {
    return 'The correct answer is: $answer';
  }

  @override
  String get next => 'Next';

  @override
  String get finish => 'Finish';

  @override
  String get quizComplete => 'Quiz Complete!';

  @override
  String get yourScore => 'Your Score';

  @override
  String outOf(int correct, int total) {
    return '$correct out of $total';
  }

  @override
  String get playAgain => 'Play Again';

  @override
  String get backToHome => 'Back to Home';

  @override
  String get wrongAnswers => 'Wrong Answers';

  @override
  String get noWrongAnswers => 'No wrong answers yet!';

  @override
  String get reviewAll => 'Review All';

  @override
  String get start => 'Start';

  @override
  String wrongCount(int count) {
    return '$count wrong';
  }

  @override
  String get recentWrong => 'Recent Wrong';

  @override
  String get yourAnswer => 'Your answer';

  @override
  String get correctAnswerLabel => 'Correct answer';

  @override
  String hoursAgo(int hours) {
    return '$hours hours ago';
  }

  @override
  String get categoryGeography => 'Geography';

  @override
  String get categoryHistory => 'History';

  @override
  String get categoryScience => 'Science';

  @override
  String get categoryArts => 'Arts & Culture';

  @override
  String get categorySports => 'Sports';

  @override
  String get categoryNature => 'Nature';

  @override
  String get categoryTechnology => 'Technology';

  @override
  String get categoryFood => 'Food & Lifestyle';

  @override
  String get soundEffects => 'Sound Effects';

  @override
  String get soundEffectsDescription => 'Play sounds on correct/wrong answers';

  @override
  String get vibration => 'Vibration';

  @override
  String get vibrationDescription => 'Vibrate on feedback';

  @override
  String get theme => 'Theme';

  @override
  String get themeLight => 'Light';

  @override
  String get themeDark => 'Dark';

  @override
  String get themeSystem => 'System';

  @override
  String get selectTheme => 'Select Theme';

  @override
  String get language => 'Language';

  @override
  String get selectLanguage => 'Select Language';

  @override
  String get systemDefault => 'System Default';

  @override
  String get about => 'About';

  @override
  String get aboutDescription =>
      'Test your knowledge with questions from around the world!';

  @override
  String get resetAllData => 'Reset All Data';

  @override
  String get resetAllDataTitle => 'Reset All Data?';

  @override
  String get resetAllDataMessage =>
      'This will delete all your quiz history and settings. This action cannot be undone.';

  @override
  String get cancel => 'Cancel';

  @override
  String get reset => 'Reset';

  @override
  String get dataResetSuccess => 'All data has been reset';

  @override
  String get exitQuiz => 'Exit Quiz?';

  @override
  String get progressWillBeLost => 'Your progress will be lost.';

  @override
  String get exit => 'Exit';

  @override
  String get loadingQuestions => 'Loading questions...';

  @override
  String get timeUp => 'Time Up!';

  @override
  String get showHint => 'Show Hint';

  @override
  String get watchAdForHint => 'Watch an ad to see the hint';

  @override
  String get watching => 'Watching';

  @override
  String get loading => 'Loading...';

  @override
  String get adLoadingMessage => 'Loading ad. Please try again shortly.';

  @override
  String get messageOutstanding => 'Outstanding! You\'re a trivia master!';

  @override
  String get messageGreatJob => 'Great job! Keep it up!';

  @override
  String get messageGoodEffort => 'Good effort! Practice makes perfect!';

  @override
  String get messageKeepLearning =>
      'Keep learning! You\'ll do better next time!';

  @override
  String get oopsSomethingWentWrong => 'Oops! Something went wrong';

  @override
  String get goBack => 'Go Back';

  @override
  String get tryAgain => 'Try Again';

  @override
  String get overallProgress => 'Overall Progress';

  @override
  String get categoryProgress => 'Category Progress';

  @override
  String get accuracy => 'Accuracy';

  @override
  String get accuracyRate => 'Accuracy Rate';

  @override
  String get unique => 'Unique';

  @override
  String get unableToLoadStats => 'Unable to load stats';

  @override
  String get youreDoingGreat => 'You\'re doing great!';

  @override
  String get leaderboardComingSoon => 'Leaderboard coming soon!';

  @override
  String get termsOfService => 'Terms of Service';

  @override
  String get privacyPolicy => 'Privacy Policy';

  @override
  String get support => 'Support';
}
