import 'package:merck_test_app/domain/domain.dart';

abstract class WeatherService {
  /// Returns weather for specified lication
  Future<WeatherEntity> getWeather(LocationEntity location);
}
