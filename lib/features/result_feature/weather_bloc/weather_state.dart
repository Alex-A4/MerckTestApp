import 'package:equatable/equatable.dart';
import 'package:merck_test_app/domain/domain.dart';

sealed class WeatherState with EquatableMixin {
  const WeatherState();
}

class InitialWeatherState extends WeatherState {
  const InitialWeatherState();

  @override
  List<Object?> get props => [];
}

class DataWeatherState extends WeatherState {
  final WeatherEntity weather;

  const DataWeatherState({required this.weather});

  @override
  List<Object?> get props => [weather];
}

class ErrorWeatherState extends WeatherState {
  const ErrorWeatherState();

  @override
  List<Object?> get props => [];
}
