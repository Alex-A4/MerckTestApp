import 'package:equatable/equatable.dart';
import 'package:merck_test_app/domain/domain.dart';

/// API ex: https://scrmobiletest.azurewebsites.net/api/route/netanya/herzelia
class RouteEntity with EquatableMixin {
  /// In KM
  final double distance;

  /// In minutes
  final Duration duration;

  final List<RouteStepEntity> steps;

  final String cityFrom;
  final String cityTo;

  RouteEntity({
    required this.distance,
    required this.duration,
    required this.steps,
    required this.cityFrom,
    required this.cityTo,
  });

  @override
  List<Object?> get props => [distance, duration, steps, cityTo, cityFrom];
}

class RouteStepEntity with EquatableMixin {
  /// Could be enum if knew all values
  final String? direction;

  final LocationEntity location;

  RouteStepEntity({required this.direction, required this.location});

  @override
  List<Object?> get props => [direction, location];
}
