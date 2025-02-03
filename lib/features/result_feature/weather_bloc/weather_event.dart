import 'package:merck_test_app/domain/domain.dart';

sealed class WeatherEvent {}

class InitWeatherEvent extends WeatherEvent {
  final LocationEntity location;

  InitWeatherEvent(this.location);
}
