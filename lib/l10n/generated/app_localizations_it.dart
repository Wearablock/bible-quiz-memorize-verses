// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Italian (`it`).
class AppLocalizationsIt extends AppLocalizations {
  AppLocalizationsIt([String locale = 'it']) : super(locale);

  @override
  String get appTitle => 'Quiz Biblico - Versetti';

  @override
  String get home => 'Home';

  @override
  String get stats => 'Statistiche';

  @override
  String get review => 'Revisione';

  @override
  String get settings => 'Impostazioni';

  @override
  String get quickQuiz => 'Quiz Veloce';

  @override
  String get quickQuizDescription => '10 domande casuali da tutte le categorie';

  @override
  String get categories => 'Categorie';

  @override
  String get yourStats => 'Le tue statistiche';

  @override
  String get answered => 'Risposte';

  @override
  String get correct => 'Corrette';

  @override
  String get questions => 'domande';

  @override
  String question(int current, int total) {
    return 'Domanda $current di $total';
  }

  @override
  String get correctAnswer => 'Corretto!';

  @override
  String get wrongAnswer => 'Sbagliato!';

  @override
  String theCorrectAnswerIs(String answer) {
    return 'La risposta corretta è: $answer';
  }

  @override
  String get next => 'Avanti';

  @override
  String get finish => 'Fine';

  @override
  String get quizComplete => 'Quiz completato!';

  @override
  String get yourScore => 'Il tuo punteggio';

  @override
  String outOf(int correct, int total) {
    return '$correct su $total';
  }

  @override
  String get playAgain => 'Gioca ancora';

  @override
  String get backToHome => 'Torna alla home';

  @override
  String get wrongAnswers => 'Risposte sbagliate';

  @override
  String get noWrongAnswers => 'Ancora nessuna risposta sbagliata!';

  @override
  String get reviewAll => 'Rivedi tutto';

  @override
  String get start => 'Inizia';

  @override
  String wrongCount(int count) {
    return '$count sbagliata/e';
  }

  @override
  String get recentWrong => 'Errori recenti';

  @override
  String get yourAnswer => 'La tua risposta';

  @override
  String get correctAnswerLabel => 'Risposta corretta';

  @override
  String hoursAgo(int hours) {
    return '$hours ore fa';
  }

  @override
  String get categoryGeography => 'Geografia';

  @override
  String get categoryHistory => 'Storia';

  @override
  String get categoryScience => 'Scienze';

  @override
  String get categoryArts => 'Arte e Cultura';

  @override
  String get categorySports => 'Sport';

  @override
  String get categoryNature => 'Natura';

  @override
  String get categoryTechnology => 'Tecnologia';

  @override
  String get categoryFood => 'Cibo e Lifestyle';

  @override
  String get soundEffects => 'Effetti sonori';

  @override
  String get soundEffectsDescription =>
      'Riproduci suoni per risposte corrette/errate';

  @override
  String get vibration => 'Vibrazione';

  @override
  String get vibrationDescription => 'Vibra al feedback';

  @override
  String get theme => 'Tema';

  @override
  String get themeLight => 'Chiaro';

  @override
  String get themeDark => 'Scuro';

  @override
  String get themeSystem => 'Sistema';

  @override
  String get selectTheme => 'Seleziona tema';

  @override
  String get language => 'Lingua';

  @override
  String get selectLanguage => 'Seleziona lingua';

  @override
  String get systemDefault => 'Predefinito di sistema';

  @override
  String get about => 'Informazioni';

  @override
  String get aboutDescription =>
      'Memorizza versetti biblici famosi attraverso quiz interattivi!';

  @override
  String get resetAllData => 'Reimposta tutti i dati';

  @override
  String get resetAllDataTitle => 'Reimpostare tutti i dati?';

  @override
  String get resetAllDataMessage =>
      'Questo eliminerà tutta la cronologia dei quiz e le impostazioni. Questa azione non può essere annullata.';

  @override
  String get cancel => 'Annulla';

  @override
  String get reset => 'Reimposta';

  @override
  String get dataResetSuccess => 'Tutti i dati sono stati reimpostati';

  @override
  String get exitQuiz => 'Uscire dal quiz?';

  @override
  String get progressWillBeLost => 'I tuoi progressi andranno persi.';

  @override
  String get exit => 'Esci';

  @override
  String get loadingQuestions => 'Caricamento domande...';

  @override
  String get timeUp => 'Tempo scaduto!';

  @override
  String get showHint => 'Mostra suggerimento';

  @override
  String get watchAdForHint =>
      'Guarda una pubblicità per vedere il suggerimento';

  @override
  String get tapToShowHint => 'Tocca per vedere il suggerimento';

  @override
  String get watching => 'Guardando';

  @override
  String get loading => 'Caricamento...';

  @override
  String get adLoadingMessage => 'Caricamento pubblicità. Riprova tra poco.';

  @override
  String get messageOutstanding =>
      'Eccezionale! Sei uno studioso della Bibbia!';

  @override
  String get messageGreatJob => 'Ottimo lavoro! Continua così!';

  @override
  String get messageGoodEffort => 'Buon impegno! La pratica rende perfetti!';

  @override
  String get messageKeepLearning =>
      'Continua a imparare! Andrà meglio la prossima volta!';

  @override
  String get oopsSomethingWentWrong => 'Ops! Qualcosa è andato storto';

  @override
  String get goBack => 'Torna indietro';

  @override
  String get tryAgain => 'Riprova';

  @override
  String get overallProgress => 'Progresso complessivo';

  @override
  String get categoryProgress => 'Progresso per categoria';

  @override
  String get accuracy => 'Precisione';

  @override
  String get accuracyRate => 'Tasso di successo';

  @override
  String get unique => 'Unico';

  @override
  String get unableToLoadStats => 'Impossibile caricare le statistiche';

  @override
  String get youreDoingGreat => 'Stai andando alla grande!';

  @override
  String get leaderboardComingSoon => 'Classifica in arrivo!';

  @override
  String get termsOfService => 'Termini di servizio';

  @override
  String get privacyPolicy => 'Informativa sulla privacy';

  @override
  String get support => 'Assistenza';

  @override
  String get premium => 'Premium';

  @override
  String get removeAds => 'Rimuovi pubblicità';

  @override
  String get premiumActivated => 'Premium attivato';

  @override
  String get purchase => 'Acquista';

  @override
  String get restorePurchases => 'Ripristina acquisti';

  @override
  String get purchaseFailed => 'Acquisto fallito';

  @override
  String get purchasesRestored => 'Acquisti ripristinati';

  @override
  String get productNotAvailable => 'Prodotto non disponibile';
}
