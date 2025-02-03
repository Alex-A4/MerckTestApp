// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i3;
import 'package:flutter/widgets.dart' as _i4;
import 'package:merck_test_app/router/routes/main_route_module.dart' as _i1;
import 'package:merck_test_app/router/routes/result_router_module.dart' as _i2;

abstract class $AppRouter extends _i3.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i3.PageFactory> pagesMap = {
    MainRouteModule.name: (routeData) {
      return _i3.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.MainPageModule(),
      );
    },
    ResultRouteModule.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<ResultRouteModuleArgs>(
          orElse: () => ResultRouteModuleArgs(
                cityFrom: pathParams.getString('from'),
                cityTo: pathParams.getString('to'),
              ));
      return _i3.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.ResultPageModule(
          cityFrom: args.cityFrom,
          cityTo: args.cityTo,
          key: args.key,
        ),
      );
    },
  };
}

/// generated route for
/// [_i1.MainPageModule]
class MainRouteModule extends _i3.PageRouteInfo<void> {
  const MainRouteModule({List<_i3.PageRouteInfo>? children})
      : super(
          MainRouteModule.name,
          initialChildren: children,
        );

  static const String name = 'MainRouteModule';

  static const _i3.PageInfo<void> page = _i3.PageInfo<void>(name);
}

/// generated route for
/// [_i2.ResultPageModule]
class ResultRouteModule extends _i3.PageRouteInfo<ResultRouteModuleArgs> {
  ResultRouteModule({
    required String cityFrom,
    required String cityTo,
    _i4.Key? key,
    List<_i3.PageRouteInfo>? children,
  }) : super(
          ResultRouteModule.name,
          args: ResultRouteModuleArgs(
            cityFrom: cityFrom,
            cityTo: cityTo,
            key: key,
          ),
          rawPathParams: {
            'from': cityFrom,
            'to': cityTo,
          },
          initialChildren: children,
        );

  static const String name = 'ResultRouteModule';

  static const _i3.PageInfo<ResultRouteModuleArgs> page = _i3.PageInfo<ResultRouteModuleArgs>(name);
}

class ResultRouteModuleArgs {
  const ResultRouteModuleArgs({
    required this.cityFrom,
    required this.cityTo,
    this.key,
  });

  final String cityFrom;

  final String cityTo;

  final _i4.Key? key;

  @override
  String toString() {
    return 'ResultRouteModuleArgs{cityFrom: $cityFrom, cityTo: $cityTo, key: $key}';
  }
}
