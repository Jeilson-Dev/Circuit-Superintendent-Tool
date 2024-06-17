import 'package:circuit_superintendent_tool/components/navigation/app_nav.dart';
import 'package:circuit_superintendent_tool/features/settings/manage_congregations/manage_congregations_page.dart';
import 'package:circuit_superintendent_tool/features/settings/settings_page.dart';
import 'package:circuit_superintendent_tool/features/visits/visits_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppRoute {
  static router(String initialRoute) => GoRouter(
        debugLogDiagnostics: true,
        initialLocation: initialRoute,
        routes: <RouteBase>[
          ShellRoute(
            pageBuilder: (context, state, child) => _buildPageWithDefaultTransition<void>(
              context: context,
              state: state,
              child: AppNav(currentPath: state.fullPath, child: child),
            ),
            routes: [
              GoRoute(
                path: '/home',
                pageBuilder: (context, state) => _buildPageWithDefaultTransition<void>(
                  state: state,
                  context: context,
                  child: Container(),
                ),
              ),
              GoRoute(
                path: '/${VisitsPage.path}',
                pageBuilder: (context, state) => _buildPageWithDefaultTransition<void>(
                  state: state,
                  context: context,
                  child: const VisitsPage(),
                ),
              ),
              GoRoute(
                path: '/congregations',
                pageBuilder: (context, state) => _buildPageWithDefaultTransition<void>(
                  state: state,
                  context: context,
                  child: Container(),
                ),
              ),
              GoRoute(
                  path: '/${SettingsPage.path}',
                  pageBuilder: (context, state) => _buildPageWithDefaultTransition<void>(
                        context: context,
                        state: state,
                        child: const SettingsPage(),
                      ),
                  routes: [
                    GoRoute(
                      path: ManageCongregationPage.path,
                      pageBuilder: (context, state) => _buildPageWithDefaultTransition<void>(
                        state: state,
                        context: context,
                        child: const ManageCongregationPage(),
                      ),
                    ),
                  ]),
            ],
          )
        ],
      );
}

CustomTransitionPage _buildPageWithDefaultTransition<T>({
  required BuildContext context,
  required GoRouterState state,
  required Widget child,
}) {
  return CustomTransitionPage<T>(
    key: state.pageKey,
    child: child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) => FadeTransition(opacity: animation, child: child),
  );
}
