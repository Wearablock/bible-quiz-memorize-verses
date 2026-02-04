// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Thai (`th`).
class AppLocalizationsTh extends AppLocalizations {
  AppLocalizationsTh([String locale = 'th']) : super(locale);

  @override
  String get appTitle => 'ควิซพระคัมภีร์ - ท่องจำ';

  @override
  String get home => 'หน้าแรก';

  @override
  String get stats => 'สถิติ';

  @override
  String get review => 'ทบทวน';

  @override
  String get settings => 'ตั้งค่า';

  @override
  String get quickQuiz => 'ควิซด่วน';

  @override
  String get quickQuizDescription => '10 คำถามสุ่มจากทุกหมวด';

  @override
  String get categories => 'หมวดหมู่';

  @override
  String get yourStats => 'สถิติของคุณ';

  @override
  String get answered => 'ตอบแล้ว';

  @override
  String get correct => 'ถูกต้อง';

  @override
  String get questions => 'คำถาม';

  @override
  String question(int current, int total) {
    return 'คำถามที่ $current จาก $total';
  }

  @override
  String get correctAnswer => 'ถูกต้อง!';

  @override
  String get wrongAnswer => 'ผิด!';

  @override
  String theCorrectAnswerIs(String answer) {
    return 'คำตอบที่ถูกต้องคือ: $answer';
  }

  @override
  String get next => 'ถัดไป';

  @override
  String get finish => 'เสร็จสิ้น';

  @override
  String get quizComplete => 'ควิซเสร็จสมบูรณ์!';

  @override
  String get yourScore => 'คะแนนของคุณ';

  @override
  String outOf(int correct, int total) {
    return '$correct จาก $total';
  }

  @override
  String get playAgain => 'เล่นอีกครั้ง';

  @override
  String get backToHome => 'กลับหน้าแรก';

  @override
  String get wrongAnswers => 'คำตอบที่ผิด';

  @override
  String get noWrongAnswers => 'ยังไม่มีคำตอบที่ผิด!';

  @override
  String get reviewAll => 'ทบทวนทั้งหมด';

  @override
  String get start => 'เริ่ม';

  @override
  String wrongCount(int count) {
    return '$count ผิด';
  }

  @override
  String get recentWrong => 'ผิดล่าสุด';

  @override
  String get yourAnswer => 'คำตอบของคุณ';

  @override
  String get correctAnswerLabel => 'คำตอบที่ถูกต้อง';

  @override
  String hoursAgo(int hours) {
    return '$hours ชั่วโมงที่แล้ว';
  }

  @override
  String get categoryGeography => 'ภูมิศาสตร์';

  @override
  String get categoryHistory => 'ประวัติศาสตร์';

  @override
  String get categoryScience => 'วิทยาศาสตร์';

  @override
  String get categoryArts => 'ศิลปะและวัฒนธรรม';

  @override
  String get categorySports => 'กีฬา';

  @override
  String get categoryNature => 'ธรรมชาติ';

  @override
  String get categoryTechnology => 'เทคโนโลยี';

  @override
  String get categoryFood => 'อาหารและไลฟ์สไตล์';

  @override
  String get soundEffects => 'เอฟเฟกต์เสียง';

  @override
  String get soundEffectsDescription => 'เล่นเสียงเมื่อตอบถูก/ผิด';

  @override
  String get vibration => 'การสั่น';

  @override
  String get vibrationDescription => 'สั่นเมื่อมีการตอบรับ';

  @override
  String get theme => 'ธีม';

  @override
  String get themeLight => 'สว่าง';

  @override
  String get themeDark => 'มืด';

  @override
  String get themeSystem => 'ตามระบบ';

  @override
  String get selectTheme => 'เลือกธีม';

  @override
  String get language => 'ภาษา';

  @override
  String get selectLanguage => 'เลือกภาษา';

  @override
  String get systemDefault => 'ค่าเริ่มต้นของระบบ';

  @override
  String get about => 'เกี่ยวกับ';

  @override
  String get aboutDescription =>
      'จดจำข้อพระคัมภีร์ที่มีชื่อเสียงผ่านแบบทดสอบแบบโต้ตอบ!';

  @override
  String get resetAllData => 'รีเซ็ตข้อมูลทั้งหมด';

  @override
  String get resetAllDataTitle => 'รีเซ็ตข้อมูลทั้งหมด?';

  @override
  String get resetAllDataMessage =>
      'การดำเนินการนี้จะลบประวัติควิซและการตั้งค่าทั้งหมด ไม่สามารถยกเลิกได้';

  @override
  String get cancel => 'ยกเลิก';

  @override
  String get reset => 'รีเซ็ต';

  @override
  String get dataResetSuccess => 'รีเซ็ตข้อมูลทั้งหมดแล้ว';

  @override
  String get exitQuiz => 'ออกจากควิซ?';

  @override
  String get progressWillBeLost => 'ความคืบหน้าของคุณจะหายไป';

  @override
  String get exit => 'ออก';

  @override
  String get loadingQuestions => 'กำลังโหลดคำถาม...';

  @override
  String get timeUp => 'หมดเวลา!';

  @override
  String get showHint => 'แสดงคำใบ้';

  @override
  String get watchAdForHint => 'ดูโฆษณาเพื่อดูคำใบ้';

  @override
  String get tapToShowHint => 'แตะเพื่อดูคำใบ้';

  @override
  String get watching => 'กำลังดู';

  @override
  String get loading => 'กำลังโหลด...';

  @override
  String get adLoadingMessage => 'กำลังโหลดโฆษณา กรุณาลองอีกครั้งในอีกสักครู่';

  @override
  String get messageOutstanding => 'ยอดเยี่ยม! คุณเป็นผู้เชี่ยวชาญพระคัมภีร์!';

  @override
  String get messageGreatJob => 'เยี่ยมมาก! ทำต่อไป!';

  @override
  String get messageGoodEffort => 'พยายามดี! ฝึกฝนทำให้สมบูรณ์แบบ!';

  @override
  String get messageKeepLearning => 'เรียนรู้ต่อไป! ครั้งหน้าจะทำได้ดีกว่า!';

  @override
  String get oopsSomethingWentWrong => 'อุ๊ปส์! เกิดข้อผิดพลาด';

  @override
  String get goBack => 'กลับ';

  @override
  String get tryAgain => 'ลองอีกครั้ง';

  @override
  String get overallProgress => 'ความคืบหน้าโดยรวม';

  @override
  String get categoryProgress => 'ความคืบหน้าตามหมวดหมู่';

  @override
  String get accuracy => 'ความแม่นยำ';

  @override
  String get accuracyRate => 'อัตราความถูกต้อง';

  @override
  String get unique => 'ไม่ซ้ำ';

  @override
  String get unableToLoadStats => 'ไม่สามารถโหลดสถิติได้';

  @override
  String get youreDoingGreat => 'คุณทำได้ดีมาก!';

  @override
  String get leaderboardComingSoon => 'กระดานผู้นำเร็วๆ นี้!';

  @override
  String get termsOfService => 'ข้อกำหนดการใช้งาน';

  @override
  String get privacyPolicy => 'นโยบายความเป็นส่วนตัว';

  @override
  String get support => 'การสนับสนุน';

  @override
  String get premium => 'พรีเมียม';

  @override
  String get removeAds => 'ลบโฆษณา';

  @override
  String get premiumActivated => 'พรีเมียมเปิดใช้งานแล้ว';

  @override
  String get purchase => 'ซื้อ';

  @override
  String get restorePurchases => 'กู้คืนการซื้อ';

  @override
  String get purchaseFailed => 'การซื้อล้มเหลว';

  @override
  String get purchasesRestored => 'กู้คืนการซื้อแล้ว';

  @override
  String get productNotAvailable => 'สินค้าไม่พร้อมใช้งาน';
}
