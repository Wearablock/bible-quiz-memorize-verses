import 'package:flutter/material.dart';
import '../../../../l10n/generated/app_localizations.dart';

class QuizLoadingView extends StatelessWidget {
  const QuizLoadingView({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CircularProgressIndicator(),
          const SizedBox(height: 16),
          Text(l10n.loadingQuestions),
        ],
      ),
    );
  }
}
