// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get appTitle => 'Глобальная Викторина';

  @override
  String get home => 'Главная';

  @override
  String get stats => 'Статистика';

  @override
  String get review => 'Повтор';

  @override
  String get settings => 'Настройки';

  @override
  String get quickQuiz => 'Быстрая викторина';

  @override
  String get quickQuizDescription => '10 случайных вопросов из всех категорий';

  @override
  String get categories => 'Категории';

  @override
  String get yourStats => 'Ваша статистика';

  @override
  String get answered => 'Отвечено';

  @override
  String get correct => 'Правильно';

  @override
  String get questions => 'вопросов';

  @override
  String question(int current, int total) {
    return 'Вопрос $current из $total';
  }

  @override
  String get correctAnswer => 'Правильно!';

  @override
  String get wrongAnswer => 'Неправильно!';

  @override
  String theCorrectAnswerIs(String answer) {
    return 'Правильный ответ: $answer';
  }

  @override
  String get next => 'Далее';

  @override
  String get finish => 'Завершить';

  @override
  String get quizComplete => 'Викторина завершена!';

  @override
  String get yourScore => 'Ваш результат';

  @override
  String outOf(int correct, int total) {
    return '$correct из $total';
  }

  @override
  String get playAgain => 'Играть снова';

  @override
  String get backToHome => 'На главную';

  @override
  String get wrongAnswers => 'Неправильные ответы';

  @override
  String get noWrongAnswers => 'Пока нет неправильных ответов!';

  @override
  String get reviewAll => 'Повторить все';

  @override
  String get start => 'Начать';

  @override
  String wrongCount(int count) {
    return '$count неправильно';
  }

  @override
  String get recentWrong => 'Недавние ошибки';

  @override
  String get yourAnswer => 'Ваш ответ';

  @override
  String get correctAnswerLabel => 'Правильный ответ';

  @override
  String hoursAgo(int hours) {
    return '$hours часов назад';
  }

  @override
  String get categoryGeography => 'География';

  @override
  String get categoryHistory => 'История';

  @override
  String get categoryScience => 'Наука';

  @override
  String get categoryArts => 'Искусство и культура';

  @override
  String get categorySports => 'Спорт';

  @override
  String get categoryNature => 'Природа';

  @override
  String get categoryTechnology => 'Технологии';

  @override
  String get categoryFood => 'Еда и образ жизни';

  @override
  String get soundEffects => 'Звуковые эффекты';

  @override
  String get soundEffectsDescription =>
      'Воспроизводить звуки при правильных/неправильных ответах';

  @override
  String get vibration => 'Вибрация';

  @override
  String get vibrationDescription => 'Вибрация при обратной связи';

  @override
  String get theme => 'Тема';

  @override
  String get themeLight => 'Светлая';

  @override
  String get themeDark => 'Тёмная';

  @override
  String get themeSystem => 'Системная';

  @override
  String get selectTheme => 'Выбрать тему';

  @override
  String get language => 'Язык';

  @override
  String get selectLanguage => 'Выбрать язык';

  @override
  String get systemDefault => 'По умолчанию системы';

  @override
  String get about => 'О приложении';

  @override
  String get aboutDescription =>
      'Проверьте свои знания с вопросами со всего мира!';

  @override
  String get resetAllData => 'Сбросить все данные';

  @override
  String get resetAllDataTitle => 'Сбросить все данные?';

  @override
  String get resetAllDataMessage =>
      'Это удалит всю историю викторин и настройки. Это действие нельзя отменить.';

  @override
  String get cancel => 'Отмена';

  @override
  String get reset => 'Сбросить';

  @override
  String get dataResetSuccess => 'Все данные сброшены';

  @override
  String get exitQuiz => 'Выйти из викторины?';

  @override
  String get progressWillBeLost => 'Ваш прогресс будет потерян.';

  @override
  String get exit => 'Выйти';

  @override
  String get loadingQuestions => 'Загрузка вопросов...';

  @override
  String get timeUp => 'Время вышло!';

  @override
  String get showHint => 'Показать подсказку';

  @override
  String get watchAdForHint => 'Посмотрите рекламу, чтобы увидеть подсказку';

  @override
  String get watching => 'Просмотр';

  @override
  String get loading => 'Загрузка...';

  @override
  String get adLoadingMessage => 'Загрузка рекламы. Попробуйте позже.';

  @override
  String get messageOutstanding => 'Превосходно! Вы мастер викторин!';

  @override
  String get messageGreatJob => 'Отличная работа! Продолжайте!';

  @override
  String get messageGoodEffort =>
      'Хорошая попытка! Практика ведёт к совершенству!';

  @override
  String get messageKeepLearning =>
      'Продолжайте учиться! В следующий раз будет лучше!';

  @override
  String get oopsSomethingWentWrong => 'Ой! Что-то пошло не так';

  @override
  String get goBack => 'Назад';

  @override
  String get tryAgain => 'Попробовать снова';

  @override
  String get overallProgress => 'Общий прогресс';

  @override
  String get categoryProgress => 'Прогресс по категориям';

  @override
  String get accuracy => 'Точность';

  @override
  String get accuracyRate => 'Процент правильных';

  @override
  String get unique => 'Уникальные';

  @override
  String get unableToLoadStats => 'Не удалось загрузить статистику';

  @override
  String get youreDoingGreat => 'Вы отлично справляетесь!';

  @override
  String get leaderboardComingSoon => 'Таблица лидеров скоро!';
}
