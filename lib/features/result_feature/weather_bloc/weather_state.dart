import 'package:equatable/equatable.dart';
import 'package:merck_test_app/domain/domain.dart';

sealed class WeatherState with EquatableMixin {}

class InitialWeatherState extends WeatherState {
  @override
  List<Object?> get props => [];
}

class DataWeatherState extends WeatherState {
  final WeatherEntity weather;

  DataWeatherState({required this.weather});

  @override
  List<Object?> get props => [weather];
}

class ErrorWeatherState extends WeatherState {
  @override
  List<Object?> get props => [];
}
