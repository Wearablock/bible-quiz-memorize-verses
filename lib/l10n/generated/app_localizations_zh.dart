// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Chinese (`zh`).
class AppLocalizationsZh extends AppLocalizations {
  AppLocalizationsZh([String locale = 'zh']) : super(locale);

  @override
  String get appTitle => '全球知识问答';

  @override
  String get home => '首页';

  @override
  String get stats => '统计';

  @override
  String get review => '复习';

  @override
  String get settings => '设置';

  @override
  String get quickQuiz => '快速问答';

  @override
  String get quickQuizDescription => '所有类别随机10题';

  @override
  String get categories => '类别';

  @override
  String get yourStats => '你的统计';

  @override
  String get answered => '已答题';

  @override
  String get correct => '正确率';

  @override
  String get questions => '题目';

  @override
  String question(int current, int total) {
    return '第$current题，共$total题';
  }

  @override
  String get correctAnswer => '正确！';

  @override
  String get wrongAnswer => '错误！';

  @override
  String theCorrectAnswerIs(String answer) {
    return '正确答案: $answer';
  }

  @override
  String get next => '下一题';

  @override
  String get finish => '完成';

  @override
  String get quizComplete => '问答完成！';

  @override
  String get yourScore => '得分';

  @override
  String outOf(int correct, int total) {
    return '$total题中答对$correct题';
  }

  @override
  String get playAgain => '再玩一次';

  @override
  String get backToHome => '返回首页';

  @override
  String get wrongAnswers => '错题';

  @override
  String get noWrongAnswers => '还没有错题！';

  @override
  String get reviewAll => '全部复习';

  @override
  String get start => '开始';

  @override
  String wrongCount(int count) {
    return '$count题错误';
  }

  @override
  String get recentWrong => '最近错题';

  @override
  String get yourAnswer => '你的答案';

  @override
  String get correctAnswerLabel => '正确答案';

  @override
  String hoursAgo(int hours) {
    return '$hours小时前';
  }

  @override
  String get categoryGeography => '地理';

  @override
  String get categoryHistory => '历史';

  @override
  String get categoryScience => '科学';

  @override
  String get categoryArts => '艺术文化';

  @override
  String get categorySports => '体育';

  @override
  String get categoryNature => '自然';

  @override
  String get categoryTechnology => '技术';

  @override
  String get categoryFood => '美食生活';

  @override
  String get soundEffects => '音效';

  @override
  String get soundEffectsDescription => '答对/答错时播放音效';

  @override
  String get vibration => '振动';

  @override
  String get vibrationDescription => '反馈时振动';

  @override
  String get theme => '主题';

  @override
  String get themeLight => '浅色';

  @override
  String get themeDark => '深色';

  @override
  String get themeSystem => '跟随系统';

  @override
  String get selectTheme => '选择主题';

  @override
  String get language => '语言';

  @override
  String get selectLanguage => '选择语言';

  @override
  String get systemDefault => '系统默认';

  @override
  String get about => '关于';

  @override
  String get aboutDescription => '通过世界各地的问答测试您的知识！';

  @override
  String get resetAllData => '重置所有数据';

  @override
  String get resetAllDataTitle => '重置所有数据？';

  @override
  String get resetAllDataMessage => '这将删除您所有的答题记录和设置。此操作无法撤销。';

  @override
  String get cancel => '取消';

  @override
  String get reset => '重置';

  @override
  String get dataResetSuccess => '所有数据已重置';

  @override
  String get exitQuiz => '退出答题？';

  @override
  String get progressWillBeLost => '您的进度将会丢失。';

  @override
  String get exit => '退出';

  @override
  String get loadingQuestions => '加载题目中...';

  @override
  String get timeUp => '时间到！';

  @override
  String get showHint => '查看提示';

  @override
  String get watchAdForHint => '观看广告以查看提示';

  @override
  String get watching => '观看中';

  @override
  String get loading => '加载中...';

  @override
  String get adLoadingMessage => '正在加载广告，请稍后重试。';

  @override
  String get messageOutstanding => '太棒了！你是答题大师！';

  @override
  String get messageGreatJob => '做得好！继续保持！';

  @override
  String get messageGoodEffort => '不错的努力！熟能生巧！';

  @override
  String get messageKeepLearning => '继续学习！下次会更好！';

  @override
  String get oopsSomethingWentWrong => '哎呀！出了点问题';

  @override
  String get goBack => '返回';

  @override
  String get tryAgain => '重试';

  @override
  String get overallProgress => '总体进度';

  @override
  String get categoryProgress => '分类进度';

  @override
  String get accuracy => '准确率';

  @override
  String get accuracyRate => '正确率';

  @override
  String get unique => '独特';

  @override
  String get unableToLoadStats => '无法加载统计数据';

  @override
  String get youreDoingGreat => '你做得很好！';

  @override
  String get leaderboardComingSoon => '排行榜即将推出！';

  @override
  String get termsOfService => '服务条款';

  @override
  String get privacyPolicy => '隐私政策';

  @override
  String get support => '支持';

  @override
  String get premium => '高级版';

  @override
  String get removeAds => '移除广告';

  @override
  String get premiumActivated => '高级版已激活';

  @override
  String get purchase => '购买';

  @override
  String get restorePurchases => '恢复购买';

  @override
  String get purchaseFailed => '购买失败';

  @override
  String get purchasesRestored => '购买已恢复';

  @override
  String get productNotAvailable => '产品不可用';
}

/// The translations for Chinese, using the Han script (`zh_Hant`).
class AppLocalizationsZhHant extends AppLocalizationsZh {
  AppLocalizationsZhHant() : super('zh_Hant');

  @override
  String get appTitle => '全球知識問答';

  @override
  String get home => '首頁';

  @override
  String get stats => '統計';

  @override
  String get review => '複習';

  @override
  String get settings => '設定';

  @override
  String get quickQuiz => '快速問答';

  @override
  String get quickQuizDescription => '所有類別隨機10題';

  @override
  String get categories => '類別';

  @override
  String get yourStats => '你的統計';

  @override
  String get answered => '已答題';

  @override
  String get correct => '正確率';

  @override
  String get questions => '題目';

  @override
  String question(int current, int total) {
    return '第$current題，共$total題';
  }

  @override
  String get correctAnswer => '正確！';

  @override
  String get wrongAnswer => '錯誤！';

  @override
  String theCorrectAnswerIs(String answer) {
    return '正確答案: $answer';
  }

  @override
  String get next => '下一題';

  @override
  String get finish => '完成';

  @override
  String get quizComplete => '問答完成！';

  @override
  String get yourScore => '得分';

  @override
  String outOf(int correct, int total) {
    return '$total題中答對$correct題';
  }

  @override
  String get playAgain => '再玩一次';

  @override
  String get backToHome => '返回首頁';

  @override
  String get wrongAnswers => '錯題';

  @override
  String get noWrongAnswers => '還沒有錯題！';

  @override
  String get reviewAll => '全部複習';

  @override
  String get start => '開始';

  @override
  String wrongCount(int count) {
    return '$count題錯誤';
  }

  @override
  String get recentWrong => '最近錯題';

  @override
  String get yourAnswer => '你的答案';

  @override
  String get correctAnswerLabel => '正確答案';

  @override
  String hoursAgo(int hours) {
    return '$hours小時前';
  }

  @override
  String get categoryGeography => '地理';

  @override
  String get categoryHistory => '歷史';

  @override
  String get categoryScience => '科學';

  @override
  String get categoryArts => '藝術文化';

  @override
  String get categorySports => '體育';

  @override
  String get categoryNature => '自然';

  @override
  String get categoryTechnology => '技術';

  @override
  String get categoryFood => '美食生活';

  @override
  String get soundEffects => '音效';

  @override
  String get soundEffectsDescription => '答對/答錯時播放音效';

  @override
  String get vibration => '震動';

  @override
  String get vibrationDescription => '回饋時震動';

  @override
  String get theme => '主題';

  @override
  String get themeLight => '淺色';

  @override
  String get themeDark => '深色';

  @override
  String get themeSystem => '跟隨系統';

  @override
  String get selectTheme => '選擇主題';

  @override
  String get language => '語言';

  @override
  String get selectLanguage => '選擇語言';

  @override
  String get systemDefault => '系統預設';

  @override
  String get about => '關於';

  @override
  String get aboutDescription => '透過世界各地的問答測試您的知識！';

  @override
  String get resetAllData => '重置所有資料';

  @override
  String get resetAllDataTitle => '重置所有資料？';

  @override
  String get resetAllDataMessage => '這將刪除您所有的答題記錄和設定。此操作無法撤銷。';

  @override
  String get cancel => '取消';

  @override
  String get reset => '重置';

  @override
  String get dataResetSuccess => '所有資料已重置';

  @override
  String get exitQuiz => '退出答題？';

  @override
  String get progressWillBeLost => '您的進度將會遺失。';

  @override
  String get exit => '退出';

  @override
  String get loadingQuestions => '載入題目中...';

  @override
  String get timeUp => '時間到！';

  @override
  String get showHint => '查看提示';

  @override
  String get watchAdForHint => '觀看廣告以查看提示';

  @override
  String get watching => '觀看中';

  @override
  String get loading => '載入中...';

  @override
  String get adLoadingMessage => '正在載入廣告，請稍後重試。';

  @override
  String get messageOutstanding => '太棒了！你是答題大師！';

  @override
  String get messageGreatJob => '做得好！繼續保持！';

  @override
  String get messageGoodEffort => '不錯的努力！熟能生巧！';

  @override
  String get messageKeepLearning => '繼續學習！下次會更好！';

  @override
  String get oopsSomethingWentWrong => '哎呀！出了點問題';

  @override
  String get goBack => '返回';

  @override
  String get tryAgain => '重試';

  @override
  String get overallProgress => '整體進度';

  @override
  String get categoryProgress => '分類進度';

  @override
  String get accuracy => '準確率';

  @override
  String get accuracyRate => '正確率';

  @override
  String get unique => '獨特';

  @override
  String get unableToLoadStats => '無法載入統計資料';

  @override
  String get youreDoingGreat => '你做得很好！';

  @override
  String get leaderboardComingSoon => '排行榜即將推出！';

  @override
  String get termsOfService => '服務條款';

  @override
  String get privacyPolicy => '隱私權政策';

  @override
  String get support => '支援';

  @override
  String get premium => '進階版';

  @override
  String get removeAds => '移除廣告';

  @override
  String get premiumActivated => '進階版已啟用';

  @override
  String get purchase => '購買';

  @override
  String get restorePurchases => '恢復購買';

  @override
  String get purchaseFailed => '購買失敗';

  @override
  String get purchasesRestored => '購買已恢復';

  @override
  String get productNotAvailable => '產品不可用';
}
