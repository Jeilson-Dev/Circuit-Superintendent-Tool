import 'package:circuit_superintendent_tool/core/core.dart';
import 'package:circuit_superintendent_tool/features/create_visit/create_visit_page.dart';
import 'package:circuit_superintendent_tool/features/list_congregations/list_congregations_page.dart';
import 'package:circuit_superintendent_tool/features/settings/manage_congregations/manage_congregations_page.dart';
import 'package:circuit_superintendent_tool/features/settings/settings_page.dart';
import 'package:circuit_superintendent_tool/features/visits/visits_page.dart';

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
                path: '/',
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
                  routes: [
                    GoRoute(
                        path: '${CreateVisitPage.path}/:congregationId',
                        pageBuilder: (context, state) {
                          final congregationId = state.pathParameters['congregationId']!;
                          return _buildPageWithDefaultTransition<void>(
                            state: state,
                            context: context,
                            child: CreateVisitPage(congregationId: congregationId),
                          );
                        }),
                  ]),
              GoRoute(
                  path: '/${ListCongregationPage.path}',
                  pageBuilder: (context, state) => _buildPageWithDefaultTransition<void>(
                        state: state,
                        context: context,
                        child: ListCongregationPage(),
                      ),
                  routes: [
                    GoRoute(
                      path: '${VisitsPage.path}/:congregationId',
                      pageBuilder: (context, state) {
                        final congregationId = state.pathParameters['congregationId']!;
                        return _buildPageWithDefaultTransition<void>(
                          state: state,
                          context: context,
                          child: VisitsPage(congregationId: congregationId),
                        );
                      },
                    ),
                  ]),
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
