// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Vietnamese (`vi`).
class AppLocalizationsVi extends AppLocalizations {
  AppLocalizationsVi([String locale = 'vi']) : super(locale);

  @override
  String get appTitle => 'Đố Vui Kiến Thức';

  @override
  String get home => 'Trang chủ';

  @override
  String get stats => 'Thống kê';

  @override
  String get review => 'Ôn tập';

  @override
  String get settings => 'Cài đặt';

  @override
  String get quickQuiz => 'Đố nhanh';

  @override
  String get quickQuizDescription => '10 câu hỏi ngẫu nhiên từ tất cả danh mục';

  @override
  String get categories => 'Danh mục';

  @override
  String get yourStats => 'Thống kê của bạn';

  @override
  String get answered => 'Đã trả lời';

  @override
  String get correct => 'Đúng';

  @override
  String get questions => 'câu hỏi';

  @override
  String question(int current, int total) {
    return 'Câu $current trên $total';
  }

  @override
  String get correctAnswer => 'Chính xác!';

  @override
  String get wrongAnswer => 'Sai!';

  @override
  String theCorrectAnswerIs(String answer) {
    return 'Đáp án đúng là: $answer';
  }

  @override
  String get next => 'Tiếp';

  @override
  String get finish => 'Hoàn thành';

  @override
  String get quizComplete => 'Hoàn thành bài đố!';

  @override
  String get yourScore => 'Điểm của bạn';

  @override
  String outOf(int correct, int total) {
    return '$correct trên $total';
  }

  @override
  String get playAgain => 'Chơi lại';

  @override
  String get backToHome => 'Về trang chủ';

  @override
  String get wrongAnswers => 'Câu trả lời sai';

  @override
  String get noWrongAnswers => 'Chưa có câu trả lời sai!';

  @override
  String get reviewAll => 'Ôn tập tất cả';

  @override
  String get start => 'Bắt đầu';

  @override
  String wrongCount(int count) {
    return '$count sai';
  }

  @override
  String get recentWrong => 'Sai gần đây';

  @override
  String get yourAnswer => 'Câu trả lời của bạn';

  @override
  String get correctAnswerLabel => 'Đáp án đúng';

  @override
  String hoursAgo(int hours) {
    return '$hours giờ trước';
  }

  @override
  String get categoryGeography => 'Địa lý';

  @override
  String get categoryHistory => 'Lịch sử';

  @override
  String get categoryScience => 'Khoa học';

  @override
  String get categoryArts => 'Nghệ thuật & Văn hóa';

  @override
  String get categorySports => 'Thể thao';

  @override
  String get categoryNature => 'Thiên nhiên';

  @override
  String get categoryTechnology => 'Công nghệ';

  @override
  String get categoryFood => 'Ẩm thực & Phong cách sống';

  @override
  String get soundEffects => 'Hiệu ứng âm thanh';

  @override
  String get soundEffectsDescription => 'Phát âm thanh khi trả lời đúng/sai';

  @override
  String get vibration => 'Rung';

  @override
  String get vibrationDescription => 'Rung khi có phản hồi';

  @override
  String get theme => 'Giao diện';

  @override
  String get themeLight => 'Sáng';

  @override
  String get themeDark => 'Tối';

  @override
  String get themeSystem => 'Hệ thống';

  @override
  String get selectTheme => 'Chọn giao diện';

  @override
  String get language => 'Ngôn ngữ';

  @override
  String get selectLanguage => 'Chọn ngôn ngữ';

  @override
  String get systemDefault => 'Mặc định hệ thống';

  @override
  String get about => 'Giới thiệu';

  @override
  String get aboutDescription =>
      'Kiểm tra kiến thức của bạn với câu hỏi từ khắp nơi trên thế giới!';

  @override
  String get resetAllData => 'Đặt lại tất cả dữ liệu';

  @override
  String get resetAllDataTitle => 'Đặt lại tất cả dữ liệu?';

  @override
  String get resetAllDataMessage =>
      'Điều này sẽ xóa tất cả lịch sử quiz và cài đặt. Hành động này không thể hoàn tác.';

  @override
  String get cancel => 'Hủy';

  @override
  String get reset => 'Đặt lại';

  @override
  String get dataResetSuccess => 'Tất cả dữ liệu đã được đặt lại';

  @override
  String get exitQuiz => 'Thoát quiz?';

  @override
  String get progressWillBeLost => 'Tiến trình của bạn sẽ bị mất.';

  @override
  String get exit => 'Thoát';

  @override
  String get loadingQuestions => 'Đang tải câu hỏi...';

  @override
  String get timeUp => 'Hết giờ!';

  @override
  String get showHint => 'Xem gợi ý';

  @override
  String get watchAdForHint => 'Xem quảng cáo để xem gợi ý';

  @override
  String get watching => 'Đang xem';

  @override
  String get loading => 'Đang tải...';

  @override
  String get adLoadingMessage => 'Đang tải quảng cáo. Vui lòng thử lại sau.';

  @override
  String get messageOutstanding => 'Xuất sắc! Bạn là bậc thầy trivia!';

  @override
  String get messageGreatJob => 'Tuyệt vời! Tiếp tục phát huy!';

  @override
  String get messageGoodEffort => 'Nỗ lực tốt! Luyện tập tạo nên hoàn hảo!';

  @override
  String get messageKeepLearning => 'Tiếp tục học hỏi! Lần sau sẽ tốt hơn!';

  @override
  String get oopsSomethingWentWrong => 'Ối! Có lỗi xảy ra';

  @override
  String get goBack => 'Quay lại';

  @override
  String get tryAgain => 'Thử lại';

  @override
  String get overallProgress => 'Tiến độ tổng thể';

  @override
  String get categoryProgress => 'Tiến độ theo danh mục';

  @override
  String get accuracy => 'Độ chính xác';

  @override
  String get accuracyRate => 'Tỷ lệ chính xác';

  @override
  String get unique => 'Duy nhất';

  @override
  String get unableToLoadStats => 'Không thể tải thống kê';

  @override
  String get youreDoingGreat => 'Bạn đang làm rất tốt!';

  @override
  String get leaderboardComingSoon => 'Bảng xếp hạng sắp ra mắt!';

  @override
  String get termsOfService => 'Điều khoản dịch vụ';

  @override
  String get privacyPolicy => 'Chính sách bảo mật';

  @override
  String get support => 'Hỗ trợ';
}
