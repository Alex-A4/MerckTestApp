import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:merck_test_app/data/data.dart';
import 'package:merck_test_app/domain/domain.dart';

@module
abstract class RouteModule {
  @lazySingleton
  RouteRepository routeRepository(Dio dio) => RouteRepository(dio: dio);

  @lazySingleton
  RouteService routeService(RouteRepository repository) => RouteServiceImpl(repository: repository);
}
