import 'package:merck_test_app/router/router.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  RouteType get defaultRouteType => const RouteType.adaptive();

  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: MainRouteModule.page,
          path: RouterPaths.main,
          initial: true,
        ),
        AutoRoute(
          page: ResultRouteModule.page,
          path: RouterPaths.result,
        ),
      ];
}
