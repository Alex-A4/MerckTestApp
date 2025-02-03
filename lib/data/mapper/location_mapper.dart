import 'package:merck_test_app/data/data.dart';
import 'package:merck_test_app/domain/domain.dart';
import 'package:merck_test_app/utils/utils.dart';

class LocationMapper extends EntityMapper<LocationEntity> {
  final LocationDto dto;

  LocationMapper({required this.dto});

  @override
  LocationEntity toEntity() => LocationEntity(
        lat: dto.lat,
        lng: dto.lng,
      );
}
