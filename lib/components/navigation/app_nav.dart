import 'dart:ui';

import 'package:circuit_superintendent_tool/core/core.dart';
import 'package:circuit_superintendent_tool/core/feature_toggles.dart';
import 'package:circuit_superintendent_tool/features/list_congregations/list_congregations_page.dart';
import 'package:circuit_superintendent_tool/features/settings/settings_page.dart';
import 'package:circuit_superintendent_tool/features/visits/visits_page.dart';
import 'package:go_router/go_router.dart';

class AppNav extends StatefulWidget {
  const AppNav({super.key, required this.child, this.currentPath});
  final Widget child;
  final String? currentPath;
  static get _appNavHeight => AppSpacing.x64;

  static placeholder() => SizedBox(height: _appNavHeight);

  @override
  State<AppNav> createState() => _AppNavState();
}

class _AppNavState extends State<AppNav> {
  String get currentPath => widget.currentPath ?? '';
  final features = inject<FeatureToggles>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        top: false,
        child: Stack(
          children: [
            widget.child,
            NavBar(items: [
              if (features.menuItemHome)
                _NavItem(
                  label: AppLocalizations.of(context)!.appNavigationBarHome,
                  icon: Icons.home,
                  route: '/',
                  currentPath: currentPath,
                ),
              if (features.menuItemVisits)
                _NavItem(
                  label: AppLocalizations.of(context)!.appNavigationBarVisits,
                  icon: Icons.calendar_month,
                  route: '/${VisitsPage.path}',
                  currentPath: currentPath,
                ),
              if (features.menuItemCongregations)
                _NavItem(
                  label: AppLocalizations.of(context)!.appNavigationBarCongregations,
                  icon: Icons.location_city_rounded,
                  route: '/${ListCongregationPage.path}',
                  currentPath: currentPath,
                ),
              if (features.menuItemSettings)
                _NavItem(
                  label: AppLocalizations.of(context)!.appNavigationBarHomeSettings,
                  icon: Icons.tune,
                  route: '/${SettingsPage.path}',
                  currentPath: currentPath,
                )
            ]),
          ],
        ),
      ),
    );
  }
}

class _NavItem extends StatefulWidget {
  const _NavItem({required this.label, required this.icon, required this.route, required this.currentPath});
  final String label;
  final String currentPath;
  final IconData icon;
  final String route;

  @override
  State<_NavItem> createState() => __NavItemState();
}

class __NavItemState extends State<_NavItem> {
  bool get isSelected => widget.currentPath.contains(widget.route);
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).appBarTheme;
    final color = isSelected ? theme.actionsIconTheme!.color : theme.actionsIconTheme!.color!.withOpacity(0.5);

    return InkWell(
      splashColor: Colors.transparent,
      overlayColor: const MaterialStatePropertyAll(Colors.transparent),
      onTap: () => context.go(widget.route),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 30, width: 40, child: Icon(widget.icon, color: color)),
          Text(widget.label, style: TextStyle(fontSize: 10, color: color), textAlign: TextAlign.center),
          Padding(
            padding: const EdgeInsets.only(top: 2.0),
            child: Center(
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 250),
                height: 2,
                width: isSelected ? 30 : 0,
                color: color,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class NavBar extends StatelessWidget {
  const NavBar({super.key, required this.items});
  final List<Widget> items;
  final blur = 3.0;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).navigationBarTheme;
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppSpacing.x12),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(AppSpacing.x12),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
            child: Container(
              height: AppNav._appNavHeight,
              decoration: BoxDecoration(
                border: Border.all(color: theme.backgroundColor!),
                color: theme.backgroundColor!.withOpacity(0.8),
                borderRadius: const BorderRadius.all(Radius.circular(AppSpacing.x12)),
              ),
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: items),
            ),
          ),
        ),
      ),
    );
  }
}
