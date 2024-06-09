import 'package:circuit_superintendent_tool/core/app_spacing.dart';
import 'package:circuit_superintendent_tool/core/feature_toggles.dart';
import 'package:circuit_superintendent_tool/core/inject.dart';
import 'package:circuit_superintendent_tool/core/localizations.dart';
import 'package:circuit_superintendent_tool/core/routes.dart';
import 'package:circuit_superintendent_tool/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppNav extends StatefulWidget {
  const AppNav({super.key, required this.child, this.currentPath});
  final Widget child;
  final String? currentPath;

  @override
  State<AppNav> createState() => _AppNavState();
}

class _AppNavState extends State<AppNav> {
  String get currentPath => widget.currentPath ?? '';
  final features = inject<FeatureToggles>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: false,
        child: Column(
          children: [
            Expanded(child: widget.child),
            Container(
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(blurRadius: 2, spreadRadius: 0.5, offset: const Offset(0, -2), color: AppColors.gray300),
                  BoxShadow(blurRadius: 4, spreadRadius: 4, offset: const Offset(0, 2), color: AppColors.white),
                ], color: AppColors.white),
                height: AppSpacing.x64,
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
                  if (features.menuItemHome)
                    _NavItem(
                      label: AppLocalizations.of(context)!.appNavigationBarHome,
                      icon: Icons.home,
                      route: AppRoute.navBarHomeRoute,
                      currentPath: currentPath,
                    ),
                  if (features.menuItemVisits)
                    _NavItem(
                      label: AppLocalizations.of(context)!.appNavigationBarVisits,
                      icon: Icons.calendar_month,
                      route: AppRoute.navBarVisitsRoute,
                      currentPath: currentPath,
                    ),
                  if (features.menuItemCongregations)
                    _NavItem(
                      label: AppLocalizations.of(context)!.appNavigationBarCongregations,
                      icon: Icons.location_city_rounded,
                      route: AppRoute.navBarCongregationRoute,
                      currentPath: currentPath,
                    ),
                  if (features.menuItemSettings)
                    _NavItem(
                      label: AppLocalizations.of(context)!.appNavigationBarHomeSettings,
                      icon: Icons.tune,
                      route: AppRoute.navBarSettingsRoute,
                      currentPath: currentPath,
                    )
                ]))
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
  bool get isSelected => widget.currentPath == widget.route;
  Color get color => isSelected ? AppColors.primary800 : AppColors.gray400;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      overlayColor: const MaterialStatePropertyAll(Colors.transparent),
      onTap: () => context.go(widget.route),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
              height: 30,
              width: 40,
              child: Icon(
                widget.icon,
                color: color,
              )),
          Text(
            widget.label,
            style: TextStyle(fontSize: 10, color: color),
            textAlign: TextAlign.center,
          ),
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
          )
        ],
      ),
    );
  }
}
