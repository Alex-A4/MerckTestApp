import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:merck_test_app/data/data.dart';
import 'package:merck_test_app/domain/domain.dart';

@module
abstract class WeatherModule {
  @lazySingleton
  WeatherService weatherService(WeatherRepository repository) => WeatherServiceImpl(repository: repository);

  @lazySingleton
  WeatherRepository weatherRepository(Dio dio) => WeatherRepository(dio: dio);
}
