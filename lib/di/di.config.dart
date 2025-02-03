// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:merck_test_app/data/data.dart' as _i166;
import 'package:merck_test_app/di/modules/base_module.dart' as _i226;
import 'package:merck_test_app/di/modules/route_module.dart' as _i367;
import 'package:merck_test_app/di/modules/weather_module.dart' as _i758;
import 'package:merck_test_app/domain/domain.dart' as _i136;
import 'package:merck_test_app/router/router.dart' as _i575;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final baseModule = _$BaseModule();
    final weatherModule = _$WeatherModule();
    final routeModule = _$RouteModule();
    gh.singleton<_i361.Dio>(() => baseModule.dio());
    gh.singleton<_i575.AppRouter>(() => baseModule.router());
    gh.lazySingleton<_i166.WeatherRepository>(() => weatherModule.weatherRepository(gh<_i361.Dio>()));
    gh.lazySingleton<_i166.RouteRepository>(() => routeModule.routeRepository(gh<_i361.Dio>()));
    gh.lazySingleton<_i136.WeatherService>(() => weatherModule.weatherService(gh<_i166.WeatherRepository>()));
    gh.lazySingleton<_i136.RouteService>(() => routeModule.routeService(gh<_i166.RouteRepository>()));
    return this;
  }
}

class _$BaseModule extends _i226.BaseModule {}

class _$WeatherModule extends _i758.WeatherModule {}

class _$RouteModule extends _i367.RouteModule {}
