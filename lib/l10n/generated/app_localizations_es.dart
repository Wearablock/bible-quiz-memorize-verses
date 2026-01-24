// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get appTitle => 'Quiz de Trivia';

  @override
  String get home => 'Inicio';

  @override
  String get stats => 'Estadísticas';

  @override
  String get review => 'Revisión';

  @override
  String get settings => 'Configuración';

  @override
  String get quickQuiz => 'Quiz Rápido';

  @override
  String get quickQuizDescription =>
      '10 preguntas aleatorias de todas las categorías';

  @override
  String get categories => 'Categorías';

  @override
  String get yourStats => 'Tus estadísticas';

  @override
  String get answered => 'Respondidas';

  @override
  String get correct => 'Correctas';

  @override
  String get questions => 'preguntas';

  @override
  String question(int current, int total) {
    return 'Pregunta $current de $total';
  }

  @override
  String get correctAnswer => '¡Correcto!';

  @override
  String get wrongAnswer => '¡Incorrecto!';

  @override
  String theCorrectAnswerIs(String answer) {
    return 'La respuesta correcta es: $answer';
  }

  @override
  String get next => 'Siguiente';

  @override
  String get finish => 'Terminar';

  @override
  String get quizComplete => '¡Quiz completado!';

  @override
  String get yourScore => 'Tu puntuación';

  @override
  String outOf(int correct, int total) {
    return '$correct de $total';
  }

  @override
  String get playAgain => 'Jugar de nuevo';

  @override
  String get backToHome => 'Volver al inicio';

  @override
  String get wrongAnswers => 'Respuestas incorrectas';

  @override
  String get noWrongAnswers => '¡Aún no hay respuestas incorrectas!';

  @override
  String get reviewAll => 'Revisar todo';

  @override
  String get start => 'Comenzar';

  @override
  String wrongCount(int count) {
    return '$count incorrecta(s)';
  }

  @override
  String get recentWrong => 'Errores recientes';

  @override
  String get yourAnswer => 'Tu respuesta';

  @override
  String get correctAnswerLabel => 'Respuesta correcta';

  @override
  String hoursAgo(int hours) {
    return 'hace $hours horas';
  }

  @override
  String get categoryGeography => 'Geografía';

  @override
  String get categoryHistory => 'Historia';

  @override
  String get categoryScience => 'Ciencias';

  @override
  String get categoryArts => 'Arte y Cultura';

  @override
  String get categorySports => 'Deportes';

  @override
  String get categoryNature => 'Naturaleza';

  @override
  String get categoryTechnology => 'Tecnología';

  @override
  String get categoryFood => 'Gastronomía y Estilo de Vida';

  @override
  String get soundEffects => 'Efectos de sonido';

  @override
  String get soundEffectsDescription =>
      'Reproducir sonidos en respuestas correctas/incorrectas';

  @override
  String get vibration => 'Vibración';

  @override
  String get vibrationDescription => 'Vibrar en retroalimentación';

  @override
  String get theme => 'Tema';

  @override
  String get themeLight => 'Claro';

  @override
  String get themeDark => 'Oscuro';

  @override
  String get themeSystem => 'Sistema';

  @override
  String get selectTheme => 'Seleccionar tema';

  @override
  String get language => 'Idioma';

  @override
  String get selectLanguage => 'Seleccionar idioma';

  @override
  String get systemDefault => 'Predeterminado del sistema';

  @override
  String get about => 'Acerca de';

  @override
  String get aboutDescription =>
      '¡Pon a prueba tus conocimientos con preguntas de todo el mundo!';

  @override
  String get resetAllData => 'Restablecer todos los datos';

  @override
  String get resetAllDataTitle => '¿Restablecer todos los datos?';

  @override
  String get resetAllDataMessage =>
      'Esto eliminará todo tu historial de cuestionarios y configuraciones. Esta acción no se puede deshacer.';

  @override
  String get cancel => 'Cancelar';

  @override
  String get reset => 'Restablecer';

  @override
  String get dataResetSuccess => 'Todos los datos han sido restablecidos';

  @override
  String get exitQuiz => '¿Salir del cuestionario?';

  @override
  String get progressWillBeLost => 'Tu progreso se perderá.';

  @override
  String get exit => 'Salir';

  @override
  String get loadingQuestions => 'Cargando preguntas...';

  @override
  String get timeUp => '¡Se acabó el tiempo!';

  @override
  String get showHint => 'Mostrar pista';

  @override
  String get watchAdForHint => 'Mira un anuncio para ver la pista';

  @override
  String get watching => 'Viendo';

  @override
  String get loading => 'Cargando...';

  @override
  String get adLoadingMessage =>
      'Cargando anuncio. Por favor, inténtalo de nuevo en breve.';

  @override
  String get messageOutstanding => '¡Excelente! ¡Eres un maestro del trivia!';

  @override
  String get messageGreatJob => '¡Buen trabajo! ¡Sigue así!';

  @override
  String get messageGoodEffort =>
      '¡Buen esfuerzo! ¡La práctica hace al maestro!';

  @override
  String get messageKeepLearning =>
      '¡Sigue aprendiendo! ¡Lo harás mejor la próxima vez!';

  @override
  String get oopsSomethingWentWrong => '¡Ups! Algo salió mal';

  @override
  String get goBack => 'Volver';

  @override
  String get tryAgain => 'Intentar de nuevo';

  @override
  String get overallProgress => 'Progreso general';

  @override
  String get categoryProgress => 'Progreso por categoría';

  @override
  String get accuracy => 'Precisión';

  @override
  String get accuracyRate => 'Tasa de aciertos';

  @override
  String get unique => 'Único';

  @override
  String get unableToLoadStats => 'No se pueden cargar las estadísticas';

  @override
  String get youreDoingGreat => '¡Lo estás haciendo genial!';

  @override
  String get leaderboardComingSoon => '¡Tabla de clasificación próximamente!';
}
