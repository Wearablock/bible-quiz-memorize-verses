import 'package:flutter/material.dart';
import '../../l10n/generated/app_localizations.dart';
import '../../presentation/screens/quiz/quiz_test_screen.dart';

class MainShell extends StatefulWidget {
  const MainShell({super.key});

  @override
  State<MainShell> createState() => _MainShellState();
}

class _MainShellState extends State<MainShell> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: [
          // Home - Quiz Test
          _HomeScreen(l10n: l10n),
          Center(child: Text(l10n.stats)),
          Center(child: Text(l10n.review)),
          Center(child: Text(l10n.settings)),
        ],
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        destinations: [
          NavigationDestination(
            icon: const Icon(Icons.home_outlined),
            selectedIcon: const Icon(Icons.home),
            label: l10n.home,
          ),
          NavigationDestination(
            icon: const Icon(Icons.bar_chart_outlined),
            selectedIcon: const Icon(Icons.bar_chart),
            label: l10n.stats,
          ),
          NavigationDestination(
            icon: const Icon(Icons.close_outlined),
            selectedIcon: const Icon(Icons.close),
            label: l10n.review,
          ),
          NavigationDestination(
            icon: const Icon(Icons.settings_outlined),
            selectedIcon: const Icon(Icons.settings),
            label: l10n.settings,
          ),
        ],
      ),
    );
  }
}

class _HomeScreen extends StatelessWidget {
  final AppLocalizations l10n;

  const _HomeScreen({required this.l10n});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.quiz, size: 80, color: Colors.blue),
          const SizedBox(height: 24),
          Text(
            'Global Trivia Quiz',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const SizedBox(height: 8),
          Text(
            'Test your knowledge!',
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: Colors.grey,
                ),
          ),
          const SizedBox(height: 32),
          ElevatedButton.icon(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const QuizTestScreen(),
                ),
              );
            },
            icon: const Icon(Icons.play_arrow),
            label: const Text('Start Quiz'),
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(
                horizontal: 32,
                vertical: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
