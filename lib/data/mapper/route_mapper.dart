import 'package:merck_test_app/data/data.dart';
import 'package:merck_test_app/domain/domain.dart';
import 'package:merck_test_app/utils/utils.dart';

class RouteMapper extends EntityMapper<RouteEntity> {
  final RouteDto dto;
  final String cityFrom;
  final String cityTo;

  RouteMapper({
    required this.dto,
    required this.cityFrom,
    required this.cityTo,
  });

  @override
  RouteEntity toEntity() => RouteEntity(
        distance: dto.distance,
        duration: Duration(minutes: dto.duration),
        cityFrom: cityFrom,
        cityTo: cityTo,
        steps: dto.steps.map((r) => RouteStepMapper(dto: r).toEntity()).toList(),
      );
}

class RouteStepMapper extends EntityMapper<RouteStepEntity> {
  final RouteStepDto dto;

  RouteStepMapper({required this.dto});

  @override
  RouteStepEntity toEntity() => RouteStepEntity(
        direction: dto.direction,
        location: LocationMapper(dto: dto.location).toEntity(),
      );
}
