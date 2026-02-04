// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Portuguese (`pt`).
class AppLocalizationsPt extends AppLocalizations {
  AppLocalizationsPt([String locale = 'pt']) : super(locale);

  @override
  String get appTitle => 'Quiz Bíblico - Versículos';

  @override
  String get home => 'Início';

  @override
  String get stats => 'Estatísticas';

  @override
  String get review => 'Revisão';

  @override
  String get settings => 'Configurações';

  @override
  String get quickQuiz => 'Quiz Rápido';

  @override
  String get quickQuizDescription =>
      '10 perguntas aleatórias de todas as categorias';

  @override
  String get categories => 'Categorias';

  @override
  String get yourStats => 'Suas estatísticas';

  @override
  String get answered => 'Respondidas';

  @override
  String get correct => 'Corretas';

  @override
  String get questions => 'perguntas';

  @override
  String question(int current, int total) {
    return 'Pergunta $current de $total';
  }

  @override
  String get correctAnswer => 'Correto!';

  @override
  String get wrongAnswer => 'Incorreto!';

  @override
  String theCorrectAnswerIs(String answer) {
    return 'A resposta correta é: $answer';
  }

  @override
  String get next => 'Próximo';

  @override
  String get finish => 'Finalizar';

  @override
  String get quizComplete => 'Quiz concluído!';

  @override
  String get yourScore => 'Sua pontuação';

  @override
  String outOf(int correct, int total) {
    return '$correct de $total';
  }

  @override
  String get playAgain => 'Jogar novamente';

  @override
  String get backToHome => 'Voltar ao início';

  @override
  String get wrongAnswers => 'Respostas erradas';

  @override
  String get noWrongAnswers => 'Ainda não há respostas erradas!';

  @override
  String get reviewAll => 'Revisar tudo';

  @override
  String get start => 'Começar';

  @override
  String wrongCount(int count) {
    return '$count errada(s)';
  }

  @override
  String get recentWrong => 'Erros recentes';

  @override
  String get yourAnswer => 'Sua resposta';

  @override
  String get correctAnswerLabel => 'Resposta correta';

  @override
  String hoursAgo(int hours) {
    return 'há $hours horas';
  }

  @override
  String get categoryGeography => 'Geografia';

  @override
  String get categoryHistory => 'História';

  @override
  String get categoryScience => 'Ciências';

  @override
  String get categoryArts => 'Arte e Cultura';

  @override
  String get categorySports => 'Esportes';

  @override
  String get categoryNature => 'Natureza';

  @override
  String get categoryTechnology => 'Tecnologia';

  @override
  String get categoryFood => 'Gastronomia e Estilo de Vida';

  @override
  String get soundEffects => 'Efeitos sonoros';

  @override
  String get soundEffectsDescription =>
      'Tocar sons em respostas corretas/erradas';

  @override
  String get vibration => 'Vibração';

  @override
  String get vibrationDescription => 'Vibrar no feedback';

  @override
  String get theme => 'Tema';

  @override
  String get themeLight => 'Claro';

  @override
  String get themeDark => 'Escuro';

  @override
  String get themeSystem => 'Sistema';

  @override
  String get selectTheme => 'Selecionar tema';

  @override
  String get language => 'Idioma';

  @override
  String get selectLanguage => 'Selecionar idioma';

  @override
  String get systemDefault => 'Padrão do sistema';

  @override
  String get about => 'Sobre';

  @override
  String get aboutDescription =>
      'Memorize versículos bíblicos famosos através de quizzes interativos!';

  @override
  String get resetAllData => 'Redefinir todos os dados';

  @override
  String get resetAllDataTitle => 'Redefinir todos os dados?';

  @override
  String get resetAllDataMessage =>
      'Isso excluirá todo o seu histórico de quiz e configurações. Esta ação não pode ser desfeita.';

  @override
  String get cancel => 'Cancelar';

  @override
  String get reset => 'Redefinir';

  @override
  String get dataResetSuccess => 'Todos os dados foram redefinidos';

  @override
  String get exitQuiz => 'Sair do quiz?';

  @override
  String get progressWillBeLost => 'Seu progresso será perdido.';

  @override
  String get exit => 'Sair';

  @override
  String get loadingQuestions => 'Carregando perguntas...';

  @override
  String get timeUp => 'Tempo esgotado!';

  @override
  String get showHint => 'Mostrar dica';

  @override
  String get watchAdForHint => 'Assista um anúncio para ver a dica';

  @override
  String get tapToShowHint => 'Toque para ver a dica';

  @override
  String get watching => 'Assistindo';

  @override
  String get loading => 'Carregando...';

  @override
  String get adLoadingMessage =>
      'Carregando anúncio. Tente novamente em breve.';

  @override
  String get messageOutstanding => 'Excelente! Você é um estudioso da Bíblia!';

  @override
  String get messageGreatJob => 'Ótimo trabalho! Continue assim!';

  @override
  String get messageGoodEffort => 'Bom esforço! A prática leva à perfeição!';

  @override
  String get messageKeepLearning =>
      'Continue aprendendo! Você vai melhorar na próxima!';

  @override
  String get oopsSomethingWentWrong => 'Ops! Algo deu errado';

  @override
  String get goBack => 'Voltar';

  @override
  String get tryAgain => 'Tentar novamente';

  @override
  String get overallProgress => 'Progresso geral';

  @override
  String get categoryProgress => 'Progresso por categoria';

  @override
  String get accuracy => 'Precisão';

  @override
  String get accuracyRate => 'Taxa de acertos';

  @override
  String get unique => 'Único';

  @override
  String get unableToLoadStats => 'Não foi possível carregar estatísticas';

  @override
  String get youreDoingGreat => 'Você está indo muito bem!';

  @override
  String get leaderboardComingSoon => 'Placar em breve!';

  @override
  String get termsOfService => 'Termos de serviço';

  @override
  String get privacyPolicy => 'Política de privacidade';

  @override
  String get support => 'Suporte';

  @override
  String get premium => 'Premium';

  @override
  String get removeAds => 'Remover anúncios';

  @override
  String get premiumActivated => 'Premium ativado';

  @override
  String get purchase => 'Comprar';

  @override
  String get restorePurchases => 'Restaurar compras';

  @override
  String get purchaseFailed => 'Falha na compra';

  @override
  String get purchasesRestored => 'Compras restauradas';

  @override
  String get productNotAvailable => 'Produto não disponível';
}
