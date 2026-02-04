// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Indonesian (`id`).
class AppLocalizationsId extends AppLocalizations {
  AppLocalizationsId([String locale = 'id']) : super(locale);

  @override
  String get appTitle => 'Kuis Alkitab - Hafal Ayat';

  @override
  String get home => 'Beranda';

  @override
  String get stats => 'Statistik';

  @override
  String get review => 'Ulasan';

  @override
  String get settings => 'Pengaturan';

  @override
  String get quickQuiz => 'Kuis Cepat';

  @override
  String get quickQuizDescription => '10 pertanyaan acak dari semua kategori';

  @override
  String get categories => 'Kategori';

  @override
  String get yourStats => 'Statistik Anda';

  @override
  String get answered => 'Dijawab';

  @override
  String get correct => 'Benar';

  @override
  String get questions => 'pertanyaan';

  @override
  String question(int current, int total) {
    return 'Pertanyaan $current dari $total';
  }

  @override
  String get correctAnswer => 'Benar!';

  @override
  String get wrongAnswer => 'Salah!';

  @override
  String theCorrectAnswerIs(String answer) {
    return 'Jawaban yang benar adalah: $answer';
  }

  @override
  String get next => 'Lanjut';

  @override
  String get finish => 'Selesai';

  @override
  String get quizComplete => 'Kuis Selesai!';

  @override
  String get yourScore => 'Skor Anda';

  @override
  String outOf(int correct, int total) {
    return '$correct dari $total';
  }

  @override
  String get playAgain => 'Main Lagi';

  @override
  String get backToHome => 'Kembali ke Beranda';

  @override
  String get wrongAnswers => 'Jawaban Salah';

  @override
  String get noWrongAnswers => 'Belum ada jawaban salah!';

  @override
  String get reviewAll => 'Ulang Semua';

  @override
  String get start => 'Mulai';

  @override
  String wrongCount(int count) {
    return '$count salah';
  }

  @override
  String get recentWrong => 'Kesalahan Terbaru';

  @override
  String get yourAnswer => 'Jawaban Anda';

  @override
  String get correctAnswerLabel => 'Jawaban yang benar';

  @override
  String hoursAgo(int hours) {
    return '$hours jam yang lalu';
  }

  @override
  String get categoryGeography => 'Geografi';

  @override
  String get categoryHistory => 'Sejarah';

  @override
  String get categoryScience => 'Sains';

  @override
  String get categoryArts => 'Seni & Budaya';

  @override
  String get categorySports => 'Olahraga';

  @override
  String get categoryNature => 'Alam';

  @override
  String get categoryTechnology => 'Teknologi';

  @override
  String get categoryFood => 'Makanan & Gaya Hidup';

  @override
  String get soundEffects => 'Efek suara';

  @override
  String get soundEffectsDescription => 'Putar suara saat jawaban benar/salah';

  @override
  String get vibration => 'Getaran';

  @override
  String get vibrationDescription => 'Getar saat ada umpan balik';

  @override
  String get theme => 'Tema';

  @override
  String get themeLight => 'Terang';

  @override
  String get themeDark => 'Gelap';

  @override
  String get themeSystem => 'Sistem';

  @override
  String get selectTheme => 'Pilih tema';

  @override
  String get language => 'Bahasa';

  @override
  String get selectLanguage => 'Pilih bahasa';

  @override
  String get systemDefault => 'Default sistem';

  @override
  String get about => 'Tentang';

  @override
  String get aboutDescription =>
      'Hafalkan ayat-ayat Alkitab terkenal melalui kuis interaktif!';

  @override
  String get resetAllData => 'Reset semua data';

  @override
  String get resetAllDataTitle => 'Reset semua data?';

  @override
  String get resetAllDataMessage =>
      'Ini akan menghapus semua riwayat kuis dan pengaturan. Tindakan ini tidak dapat dibatalkan.';

  @override
  String get cancel => 'Batal';

  @override
  String get reset => 'Reset';

  @override
  String get dataResetSuccess => 'Semua data telah direset';

  @override
  String get exitQuiz => 'Keluar dari kuis?';

  @override
  String get progressWillBeLost => 'Progres Anda akan hilang.';

  @override
  String get exit => 'Keluar';

  @override
  String get loadingQuestions => 'Memuat pertanyaan...';

  @override
  String get timeUp => 'Waktu habis!';

  @override
  String get showHint => 'Tampilkan petunjuk';

  @override
  String get watchAdForHint => 'Tonton iklan untuk melihat petunjuk';

  @override
  String get tapToShowHint => 'Ketuk untuk melihat petunjuk';

  @override
  String get watching => 'Menonton';

  @override
  String get loading => 'Memuat...';

  @override
  String get adLoadingMessage => 'Memuat iklan. Silakan coba lagi sebentar.';

  @override
  String get messageOutstanding => 'Luar biasa! Anda ahli Alkitab!';

  @override
  String get messageGreatJob => 'Kerja bagus! Terus semangat!';

  @override
  String get messageGoodEffort => 'Usaha yang bagus! Latihan membuat sempurna!';

  @override
  String get messageKeepLearning =>
      'Terus belajar! Anda akan lebih baik lain kali!';

  @override
  String get oopsSomethingWentWrong => 'Ups! Terjadi kesalahan';

  @override
  String get goBack => 'Kembali';

  @override
  String get tryAgain => 'Coba lagi';

  @override
  String get overallProgress => 'Progres keseluruhan';

  @override
  String get categoryProgress => 'Progres per kategori';

  @override
  String get accuracy => 'Akurasi';

  @override
  String get accuracyRate => 'Tingkat kebenaran';

  @override
  String get unique => 'Unik';

  @override
  String get unableToLoadStats => 'Tidak dapat memuat statistik';

  @override
  String get youreDoingGreat => 'Anda hebat!';

  @override
  String get leaderboardComingSoon => 'Papan peringkat segera hadir!';

  @override
  String get termsOfService => 'Ketentuan Layanan';

  @override
  String get privacyPolicy => 'Kebijakan Privasi';

  @override
  String get support => 'Dukungan';

  @override
  String get premium => 'Premium';

  @override
  String get removeAds => 'Hapus Iklan';

  @override
  String get premiumActivated => 'Premium telah diaktifkan';

  @override
  String get purchase => 'Beli';

  @override
  String get restorePurchases => 'Pulihkan Pembelian';

  @override
  String get purchaseFailed => 'Pembelian gagal';

  @override
  String get purchasesRestored => 'Pembelian dipulihkan';

  @override
  String get productNotAvailable => 'Produk tidak tersedia';
}
