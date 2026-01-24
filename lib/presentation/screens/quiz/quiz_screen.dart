import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/services/ad_service.dart';
import '../../../domain/quiz/quiz_state.dart';
import '../../../providers/quiz_providers.dart';
import '../../../l10n/generated/app_localizations.dart';
import 'quiz_mode.dart';
import 'widgets/question_view.dart';
import 'widgets/answer_result_view.dart';
import 'widgets/quiz_complete_view.dart';
import 'widgets/quiz_loading_view.dart';
import 'widgets/quiz_error_view.dart';

class QuizScreen extends ConsumerStatefulWidget {
  final QuizMode mode;
  final String? categoryId;

  const QuizScreen({
    super.key,
    required this.mode,
    this.categoryId,
  });

  @override
  ConsumerState<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends ConsumerState<QuizScreen>
    with WidgetsBindingObserver {
  bool _hasShownInterstitial = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    WidgetsBinding.instance.addPostFrameCallback((_) => _startQuiz());
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    final notifier = ref.read(quizProvider.notifier);
    if (state == AppLifecycleState.paused) {
      notifier.pauseTimer();
    } else if (state == AppLifecycleState.resumed) {
      notifier.resumeTimer();
    }
  }

  void _startQuiz() {
    final locale = Localizations.localeOf(context);
    final localeStr = locale.toLanguageTag().replaceAll('-', '_');
    final notifier = ref.read(quizProvider.notifier);

    switch (widget.mode) {
      case QuizMode.category:
        notifier.startCategoryQuiz(
          categoryId: widget.categoryId!,
          locale: localeStr,
          questionCount: 10,
        );
        break;
      case QuizMode.random:
        notifier.startRandomQuiz(
          locale: localeStr,
          questionCount: 10,
        );
        break;
      case QuizMode.review:
        notifier.startReviewQuiz(
          locale: localeStr,
          categoryId: widget.categoryId,
          limit: 10,
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final phase = ref.watch(quizPhaseProvider);
    final l10n = AppLocalizations.of(context)!;

    return PopScope(
      canPop: phase == QuizPhase.completed || phase == QuizPhase.error,
      onPopInvokedWithResult: (didPop, _) {
        if (!didPop) {
          _showExitDialog();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(_getTitle(l10n)),
          leading: IconButton(
            icon: const Icon(Icons.close),
            onPressed: () {
              if (phase == QuizPhase.completed || phase == QuizPhase.error) {
                Navigator.pop(context);
              } else {
                _showExitDialog();
              }
            },
          ),
        ),
        body: SafeArea(
          child: switch (phase) {
            QuizPhase.initial || QuizPhase.loading => const QuizLoadingView(),
            QuizPhase.answering => const QuestionView(),
            QuizPhase.answered => const AnswerResultView(),
            QuizPhase.completed => QuizCompleteView(
                onPlayAgain: () {
                  _hasShownInterstitial = false;
                  ref.read(quizProvider.notifier).reset();
                  _startQuiz();
                },
                onExit: () async {
                  // 전면 광고 표시 (퀴즈 종료 시 1회)
                  if (!_hasShownInterstitial) {
                    _hasShownInterstitial = true;
                    await AdService().showInterstitialAd();
                  }
                  if (mounted) Navigator.pop(context);
                },
              ),
            QuizPhase.error => QuizErrorView(
                onRetry: _startQuiz,
                onExit: () => Navigator.pop(context),
              ),
          },
        ),
      ),
    );
  }

  String _getTitle(AppLocalizations l10n) {
    switch (widget.mode) {
      case QuizMode.category:
        return _getCategoryName(widget.categoryId!, l10n);
      case QuizMode.random:
        return l10n.quickQuiz;
      case QuizMode.review:
        return l10n.review;
    }
  }

  String _getCategoryName(String categoryId, AppLocalizations l10n) {
    switch (categoryId) {
      case 'geography':
        return l10n.categoryGeography;
      case 'history':
        return l10n.categoryHistory;
      case 'science':
        return l10n.categoryScience;
      case 'arts':
        return l10n.categoryArts;
      case 'sports':
        return l10n.categorySports;
      case 'nature':
        return l10n.categoryNature;
      case 'technology':
        return l10n.categoryTechnology;
      case 'food':
        return l10n.categoryFood;
      default:
        return categoryId;
    }
  }

  Future<void> _showExitDialog() async {
    final l10n = AppLocalizations.of(context)!;
    final result = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(l10n.exitQuiz),
        content: Text(l10n.progressWillBeLost),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: Text(l10n.cancel),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: Text(l10n.exit),
          ),
        ],
      ),
    );

    if (result == true && mounted) {
      ref.read(quizProvider.notifier).quitQuiz();
      Navigator.pop(context);
    }
  }
}
