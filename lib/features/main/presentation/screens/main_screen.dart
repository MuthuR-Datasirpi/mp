import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile/core/resources/drawables.dart';
import 'package:mobile/features/main/presentation/widgets/custom_navigation_destination.dart';
import 'package:mobile/l10n/app_localizations_extension.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({
    Key? key,
    required this.navigationShell,
  }) : super(key: key ?? const ValueKey('MainScreen'));
  final StatefulNavigationShell navigationShell;

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    final index = widget.navigationShell.currentIndex;
    return Scaffold(
      body: widget.navigationShell,
      bottomNavigationBar: NavigationBar(
        selectedIndex: index,
        indicatorColor: Colors.transparent,
        ///---IMPORTANT---
        // For every `BottomNavigationBarItem`, there must be a StatefulShellBranch
        // defined within your `AppRouter` class
        destinations: [
          CustomNavigationDestination(
            Drawables.navIconHome,
            Drawables.navIconHomeActive,
            label: context.appStrings.home,
            selected: index == 0,
          ),
          CustomNavigationDestination(
            Drawables.navMyPlans,
            Drawables.navMyPlansActive,
            label: context.appStrings.my_plans,
            showBadge: false,
            count: 3,
            selected: index == 1,
          ),
          CustomNavigationDestination(
            Drawables.navWellness,
            Drawables.navWellnessActive,
            label: context.appStrings.wellness,
            selected: index == 2,
          ),
          CustomNavigationDestination(
            Drawables.navProfile,
            Drawables.navProfileActive,
            label: context.appStrings.profile,
            showBadge: false,
            selected: index == 3,
          ),
        ],
        onDestinationSelected: _goToDestination,
      ),
    );
  }

  void _goToDestination(int index) {
    widget.navigationShell.goBranch(
      index,
      // A common pattern when using bottom navigation bars is to support
      // navigating to the initial location when tapping the item that is
      // already active. This example demonstrates how to support this behavior,
      // using the initialLocation parameter of goBranch.
      initialLocation: index == widget.navigationShell.currentIndex,
    );
  }
}
