import 'package:json_annotation/json_annotation.dart';
import 'package:merck_test_app/data/dto/dto.dart';

part 'route_dto.g.dart';

@JsonSerializable()
class RouteDto {
  final double distance;
  final int duration;
  final List<RouteStepDto> steps;

  RouteDto({required this.distance, required this.duration, required this.steps});

  factory RouteDto.fromJson(Map<String, dynamic> json) => _$RouteDtoFromJson(json);
}

@JsonSerializable()
class RouteStepDto {
  final String? direction;
  final LocationDto location;

  RouteStepDto({required this.direction, required this.location});

  factory RouteStepDto.fromJson(Map<String, dynamic> json) => _$RouteStepDtoFromJson(json);
}
