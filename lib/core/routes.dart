import 'package:circuit_superintendent_tool/components/navigation/app_nav.dart';
import 'package:circuit_superintendent_tool/features/congregations/congregations_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppRoute {
  static get router => GoRouter(
        debugLogDiagnostics: true,
        initialLocation: '/',
        routes: <RouteBase>[
          ShellRoute(
              pageBuilder: (context, state, child) =>
                  _buildPageWithDefaultTransition<void>(context: context, state: state, child: AppNav(child: child, currentPath: state.fullPath)),
              routes: [
                GoRoute(
                  path: '/',
                  builder: (BuildContext context, GoRouterState state) => Container(),
                  pageBuilder: (context, state) => _buildPageWithDefaultTransition<void>(
                    state: state,
                    context: context,
                    child: Container(
                      color: Colors.blueGrey,
                      child: Builder(builder: (context) {
                        return Container();
                      }),
                    ),
                  ),
                  routes: [
                    GoRoute(
                      path: 'visits',
                      pageBuilder: (context, state) => _buildPageWithDefaultTransition<void>(
                        state: state,
                        context: context,
                        child: Container(
                          color: Colors.amber,
                          child: const Center(child: Text('Visitas')),
                        ),
                      ),
                      routes: [],
                    ),
                    GoRoute(
                      path: 'congregations',
                      pageBuilder: (context, state) => _buildPageWithDefaultTransition<void>(
                        state: state,
                        context: context,
                        child: const CongregationPage(),
                      ),
                      routes: [],
                    ),
                    GoRoute(
                      path: 'settings',
                      pageBuilder: (context, state) => _buildPageWithDefaultTransition<void>(
                        context: context,
                        state: state,
                        child: Container(
                          color: Colors.red,
                          child: const Center(
                            child: Text('Configurações'),
                          ),
                        ),
                      ),
                      routes: [],
                    ),
                  ],
                )
              ]),
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
