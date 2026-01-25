// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Japanese (`ja`).
class AppLocalizationsJa extends AppLocalizations {
  AppLocalizationsJa([String locale = 'ja']) : super(locale);

  @override
  String get appTitle => 'グローバルトリビアクイズ';

  @override
  String get home => 'ホーム';

  @override
  String get stats => '統計';

  @override
  String get review => '復習';

  @override
  String get settings => '設定';

  @override
  String get quickQuiz => 'クイッククイズ';

  @override
  String get quickQuizDescription => '全カテゴリからランダム10問';

  @override
  String get categories => 'カテゴリ';

  @override
  String get yourStats => 'あなたの統計';

  @override
  String get answered => '回答数';

  @override
  String get correct => '正解率';

  @override
  String get questions => '問題';

  @override
  String question(int current, int total) {
    return '$total問中$current問目';
  }

  @override
  String get correctAnswer => '正解！';

  @override
  String get wrongAnswer => '不正解！';

  @override
  String theCorrectAnswerIs(String answer) {
    return '正解: $answer';
  }

  @override
  String get next => '次へ';

  @override
  String get finish => '完了';

  @override
  String get quizComplete => 'クイズ完了！';

  @override
  String get yourScore => 'スコア';

  @override
  String outOf(int correct, int total) {
    return '$total問中$correct問正解';
  }

  @override
  String get playAgain => 'もう一度';

  @override
  String get backToHome => 'ホームへ';

  @override
  String get wrongAnswers => '間違えた問題';

  @override
  String get noWrongAnswers => '間違えた問題はありません！';

  @override
  String get reviewAll => '全て復習';

  @override
  String get start => '開始';

  @override
  String wrongCount(int count) {
    return '$count問不正解';
  }

  @override
  String get recentWrong => '最近の不正解';

  @override
  String get yourAnswer => 'あなたの答え';

  @override
  String get correctAnswerLabel => '正解';

  @override
  String hoursAgo(int hours) {
    return '$hours時間前';
  }

  @override
  String get categoryGeography => '地理';

  @override
  String get categoryHistory => '歴史';

  @override
  String get categoryScience => '科学';

  @override
  String get categoryArts => '芸術・文化';

  @override
  String get categorySports => 'スポーツ';

  @override
  String get categoryNature => '自然';

  @override
  String get categoryTechnology => '技術';

  @override
  String get categoryFood => '食・生活';

  @override
  String get soundEffects => '効果音';

  @override
  String get soundEffectsDescription => '正解/不正解時に効果音を再生';

  @override
  String get vibration => 'バイブレーション';

  @override
  String get vibrationDescription => 'フィードバック時に振動';

  @override
  String get theme => 'テーマ';

  @override
  String get themeLight => 'ライト';

  @override
  String get themeDark => 'ダーク';

  @override
  String get themeSystem => 'システム';

  @override
  String get selectTheme => 'テーマを選択';

  @override
  String get language => '言語';

  @override
  String get selectLanguage => '言語を選択';

  @override
  String get systemDefault => 'システムデフォルト';

  @override
  String get about => 'アプリについて';

  @override
  String get aboutDescription => '世界中のクイズで知識をテストしよう！';

  @override
  String get resetAllData => 'すべてのデータをリセット';

  @override
  String get resetAllDataTitle => 'すべてのデータをリセットしますか？';

  @override
  String get resetAllDataMessage => 'クイズの履歴と設定がすべて削除されます。この操作は元に戻せません。';

  @override
  String get cancel => 'キャンセル';

  @override
  String get reset => 'リセット';

  @override
  String get dataResetSuccess => 'すべてのデータがリセットされました';

  @override
  String get exitQuiz => 'クイズを終了しますか？';

  @override
  String get progressWillBeLost => '進行状況が失われます。';

  @override
  String get exit => '終了';

  @override
  String get loadingQuestions => '問題を読み込み中...';

  @override
  String get timeUp => '時間切れ！';

  @override
  String get showHint => 'ヒントを見る';

  @override
  String get watchAdForHint => '広告を見てヒントを確認';

  @override
  String get watching => '視聴中';

  @override
  String get loading => '読み込み中...';

  @override
  String get adLoadingMessage => '広告を読み込んでいます。しばらくしてからお試しください。';

  @override
  String get messageOutstanding => '素晴らしい！クイズマスターですね！';

  @override
  String get messageGreatJob => 'よくできました！その調子！';

  @override
  String get messageGoodEffort => 'いい努力です！練習あるのみ！';

  @override
  String get messageKeepLearning => '学び続けましょう！次はもっとうまくいきます！';

  @override
  String get oopsSomethingWentWrong => 'おっと！問題が発生しました';

  @override
  String get goBack => '戻る';

  @override
  String get tryAgain => '再試行';

  @override
  String get overallProgress => '全体の進捗';

  @override
  String get categoryProgress => 'カテゴリ別進捗';

  @override
  String get accuracy => '正確さ';

  @override
  String get accuracyRate => '正答率';

  @override
  String get unique => 'ユニーク';

  @override
  String get unableToLoadStats => '統計を読み込めません';

  @override
  String get youreDoingGreat => '順調ですね！';

  @override
  String get leaderboardComingSoon => 'リーダーボードは近日公開！';

  @override
  String get termsOfService => '利用規約';

  @override
  String get privacyPolicy => 'プライバシーポリシー';

  @override
  String get support => 'サポート';

  @override
  String get premium => 'プレミアム';

  @override
  String get removeAds => '広告を削除';

  @override
  String get premiumActivated => 'プレミアムが有効になりました';

  @override
  String get purchase => '購入';

  @override
  String get restorePurchases => '購入を復元';

  @override
  String get purchaseFailed => '購入に失敗しました';

  @override
  String get purchasesRestored => '購入が復元されました';

  @override
  String get productNotAvailable => '商品を読み込めません';
}
