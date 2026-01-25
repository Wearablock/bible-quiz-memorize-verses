// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get appTitle => 'Quiz Culture Générale';

  @override
  String get home => 'Accueil';

  @override
  String get stats => 'Statistiques';

  @override
  String get review => 'Révision';

  @override
  String get settings => 'Paramètres';

  @override
  String get quickQuiz => 'Quiz Rapide';

  @override
  String get quickQuizDescription =>
      '10 questions aléatoires de toutes catégories';

  @override
  String get categories => 'Catégories';

  @override
  String get yourStats => 'Vos statistiques';

  @override
  String get answered => 'Répondu';

  @override
  String get correct => 'Correct';

  @override
  String get questions => 'questions';

  @override
  String question(int current, int total) {
    return 'Question $current sur $total';
  }

  @override
  String get correctAnswer => 'Correct!';

  @override
  String get wrongAnswer => 'Incorrect!';

  @override
  String theCorrectAnswerIs(String answer) {
    return 'La bonne réponse est: $answer';
  }

  @override
  String get next => 'Suivant';

  @override
  String get finish => 'Terminer';

  @override
  String get quizComplete => 'Quiz terminé!';

  @override
  String get yourScore => 'Votre score';

  @override
  String outOf(int correct, int total) {
    return '$correct sur $total';
  }

  @override
  String get playAgain => 'Rejouer';

  @override
  String get backToHome => 'Retour à l\'accueil';

  @override
  String get wrongAnswers => 'Mauvaises réponses';

  @override
  String get noWrongAnswers => 'Pas encore de mauvaises réponses!';

  @override
  String get reviewAll => 'Tout réviser';

  @override
  String get start => 'Commencer';

  @override
  String wrongCount(int count) {
    return '$count erreur(s)';
  }

  @override
  String get recentWrong => 'Erreurs récentes';

  @override
  String get yourAnswer => 'Votre réponse';

  @override
  String get correctAnswerLabel => 'Bonne réponse';

  @override
  String hoursAgo(int hours) {
    return 'il y a $hours heures';
  }

  @override
  String get categoryGeography => 'Géographie';

  @override
  String get categoryHistory => 'Histoire';

  @override
  String get categoryScience => 'Sciences';

  @override
  String get categoryArts => 'Arts & Culture';

  @override
  String get categorySports => 'Sports';

  @override
  String get categoryNature => 'Nature';

  @override
  String get categoryTechnology => 'Technologie';

  @override
  String get categoryFood => 'Gastronomie & Lifestyle';

  @override
  String get soundEffects => 'Effets sonores';

  @override
  String get soundEffectsDescription =>
      'Jouer des sons pour les bonnes/mauvaises réponses';

  @override
  String get vibration => 'Vibration';

  @override
  String get vibrationDescription => 'Vibrer lors du retour';

  @override
  String get theme => 'Thème';

  @override
  String get themeLight => 'Clair';

  @override
  String get themeDark => 'Sombre';

  @override
  String get themeSystem => 'Système';

  @override
  String get selectTheme => 'Sélectionner le thème';

  @override
  String get language => 'Langue';

  @override
  String get selectLanguage => 'Sélectionner la langue';

  @override
  String get systemDefault => 'Par défaut du système';

  @override
  String get about => 'À propos';

  @override
  String get aboutDescription =>
      'Testez vos connaissances avec des questions du monde entier !';

  @override
  String get resetAllData => 'Réinitialiser toutes les données';

  @override
  String get resetAllDataTitle => 'Réinitialiser toutes les données ?';

  @override
  String get resetAllDataMessage =>
      'Cela supprimera tout votre historique de quiz et vos paramètres. Cette action est irréversible.';

  @override
  String get cancel => 'Annuler';

  @override
  String get reset => 'Réinitialiser';

  @override
  String get dataResetSuccess => 'Toutes les données ont été réinitialisées';

  @override
  String get exitQuiz => 'Quitter le quiz ?';

  @override
  String get progressWillBeLost => 'Votre progression sera perdue.';

  @override
  String get exit => 'Quitter';

  @override
  String get loadingQuestions => 'Chargement des questions...';

  @override
  String get timeUp => 'Temps écoulé !';

  @override
  String get showHint => 'Afficher l\'indice';

  @override
  String get watchAdForHint => 'Regardez une pub pour voir l\'indice';

  @override
  String get watching => 'Visionnage';

  @override
  String get loading => 'Chargement...';

  @override
  String get adLoadingMessage =>
      'Chargement de la pub. Veuillez réessayer dans un instant.';

  @override
  String get messageOutstanding =>
      'Exceptionnel ! Vous êtes un maître du trivia !';

  @override
  String get messageGreatJob => 'Excellent travail ! Continuez !';

  @override
  String get messageGoodEffort =>
      'Bon effort ! C\'est en forgeant qu\'on devient forgeron !';

  @override
  String get messageKeepLearning =>
      'Continuez à apprendre ! Vous ferez mieux la prochaine fois !';

  @override
  String get oopsSomethingWentWrong => 'Oups ! Une erreur s\'est produite';

  @override
  String get goBack => 'Retour';

  @override
  String get tryAgain => 'Réessayer';

  @override
  String get overallProgress => 'Progression globale';

  @override
  String get categoryProgress => 'Progression par catégorie';

  @override
  String get accuracy => 'Précision';

  @override
  String get accuracyRate => 'Taux de réussite';

  @override
  String get unique => 'Unique';

  @override
  String get unableToLoadStats => 'Impossible de charger les statistiques';

  @override
  String get youreDoingGreat => 'Vous vous en sortez très bien !';

  @override
  String get leaderboardComingSoon => 'Classement bientôt disponible !';

  @override
  String get termsOfService => 'Conditions d\'utilisation';

  @override
  String get privacyPolicy => 'Politique de confidentialité';

  @override
  String get support => 'Assistance';
}
