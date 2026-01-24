import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/services/ad_service.dart';
import '../../../../core/services/feedback_service.dart';
import '../../../../providers/quiz_providers.dart';
import '../../../../l10n/generated/app_localizations.dart';

class HintSection extends ConsumerWidget {
  const HintSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final canUseHint = ref.watch(canUseHintProvider);
    final hintText = ref.watch(hintTextProvider);

    if (hintText != null) {
      // 힌트 표시
      return Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.amber.shade50,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.amber.shade200),
        ),
        child: Row(
          children: [
            Icon(Icons.lightbulb, color: Colors.amber.shade700),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                hintText,
                style: TextStyle(color: Colors.amber.shade900),
              ),
            ),
          ],
        ),
      );
    }

    if (canUseHint) {
      // 힌트 버튼
      return _HintButton(
        onHintUnlocked: () {
          ref.read(quizProvider.notifier).useHint();
          FeedbackService().onHintUsed();
        },
      );
    }

    return const SizedBox.shrink();
  }
}

/// 힌트 버튼 (보상형 광고 연동)
class _HintButton extends StatefulWidget {
  final VoidCallback onHintUnlocked;

  const _HintButton({required this.onHintUnlocked});

  @override
  State<_HintButton> createState() => _HintButtonState();
}

class _HintButtonState extends State<_HintButton> {
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    final adService = AdService();
    final l10n = AppLocalizations.of(context)!;

    return ListenableBuilder(
      listenable: adService,
      builder: (context, _) {
        final isAdReady = adService.isRewardedAdReady;

        return Card(
          child: ListTile(
            leading: Icon(
              Icons.lightbulb_outline,
              color: Colors.amber.shade700,
            ),
            title: Text(l10n.showHint),
            subtitle: Text(
              isAdReady ? l10n.watchAdForHint : l10n.loading,
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey.shade600,
              ),
            ),
            trailing: _isLoading
                ? const SizedBox(
                    width: 24,
                    height: 24,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  )
                : ElevatedButton.icon(
                    onPressed: isAdReady ? _showRewardedAd : null,
                    icon: const Icon(Icons.play_circle_outline, size: 18),
                    label: Text(isAdReady ? l10n.watching : l10n.loading),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 8,
                      ),
                    ),
                  ),
          ),
        );
      },
    );
  }

  Future<void> _showRewardedAd() async {
    setState(() => _isLoading = true);

    final success = await AdService().showRewardedAd(
      onRewarded: () {
        widget.onHintUnlocked();
      },
    );

    if (mounted) {
      setState(() => _isLoading = false);

      if (!success) {
        final l10n = AppLocalizations.of(context)!;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(l10n.adLoadingMessage),
          ),
        );
      }
    }
  }
}
