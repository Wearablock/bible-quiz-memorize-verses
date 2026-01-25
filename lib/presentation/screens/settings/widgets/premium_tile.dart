import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/services/iap_service.dart';
import '../../../../l10n/generated/app_localizations.dart';
import '../../../../providers/premium_provider.dart';

/// 프리미엄 (광고 제거) 타일
class PremiumTile extends ConsumerWidget {
  const PremiumTile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final isPremium = ref.watch(isPremiumProvider);
    final product = ref.watch(removeAdsProductProvider);
    final isAvailable = ref.watch(isIAPAvailableProvider);

    // 이미 프리미엄 사용자인 경우
    if (isPremium) {
      return ListTile(
        leading: const Icon(
          Icons.check_circle,
          color: Colors.green,
        ),
        title: Text(l10n.removeAds),
        subtitle: Text(l10n.premiumActivated),
      );
    }

    // 일반 사용자: 구매 UI 표시
    return Column(
      children: [
        // 광고 제거 구매 버튼
        ListTile(
          leading: const Icon(Icons.block),
          title: Text(l10n.removeAds),
          subtitle: Text(
            isAvailable && product != null
                ? product.price
                : l10n.productNotAvailable,
          ),
          trailing: ElevatedButton(
            onPressed: isAvailable && product != null
                ? () => _purchaseRemoveAds(context, l10n)
                : null,
            child: Text(l10n.purchase),
          ),
        ),

        const Divider(height: 1, indent: 56),

        // 구매 복원 버튼 (App Store 정책 필수)
        ListTile(
          leading: const Icon(Icons.restore),
          title: Text(l10n.restorePurchases),
          onTap: () => _restorePurchases(context, l10n),
        ),
      ],
    );
  }

  Future<void> _purchaseRemoveAds(BuildContext context, AppLocalizations l10n) async {
    final success = await IAPService().purchaseRemoveAds();
    if (!success && context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(l10n.purchaseFailed)),
      );
    }
  }

  Future<void> _restorePurchases(BuildContext context, AppLocalizations l10n) async {
    await IAPService().restorePurchases();
    if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(l10n.purchasesRestored)),
      );
    }
  }
}
