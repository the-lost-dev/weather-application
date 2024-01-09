import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:weather_app/exports.dart';

part 'router.g.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();

@Riverpod(keepAlive: true)
GoRouter goRouter(GoRouterRef ref) {
  return GoRouter(
    initialLocation: '/',
    debugLogDiagnostics: false,
    navigatorKey: _rootNavigatorKey,
    routes: [
      GoRoute(
        path: AppRoutes.weatherPage.path,
        name: AppRoutes.weatherPage.name,
        parentNavigatorKey: _rootNavigatorKey,
        builder: (context, state) => WeatherPage(key: state.pageKey),
      ),
    ],
  );
}
