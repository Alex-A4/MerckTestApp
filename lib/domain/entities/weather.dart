import 'package:equatable/equatable.dart';
import 'package:merck_test_app/domain/domain.dart';

/// API ex: https://scrmobiletest.azurewebsites.net/api/Weather/32.2/35.5
class WeatherEntity with EquatableMixin {
  final String description;
  final LocationEntity location;
  final double temperature;

  WeatherEntity({
    required this.description,
    required this.location,
    required this.temperature,
  });

  @override
  List<Object?> get props => [description, location, temperature];
}
