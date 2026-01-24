import 'package:flutter/material.dart';
import '../../l10n/generated/app_localizations.dart';
import '../../presentation/screens/home/home_screen.dart';
import '../../presentation/screens/stats/stats_screen.dart';
import '../../presentation/screens/review/review_screen.dart';
import '../../presentation/screens/settings/settings_screen.dart';
import '../../presentation/widgets/ads/banner_ad_widget.dart';

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
        children: const [
          HomeScreen(),
          StatsScreen(),
          ReviewScreen(),
          SettingsScreen(),
        ],
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // 배너 광고
          const BannerAdWidget(),
          // 네비게이션 바
          NavigationBar(
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
                icon: const Icon(Icons.replay_outlined),
                selectedIcon: const Icon(Icons.replay),
                label: l10n.review,
              ),
              NavigationDestination(
                icon: const Icon(Icons.settings_outlined),
                selectedIcon: const Icon(Icons.settings),
                label: l10n.settings,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
