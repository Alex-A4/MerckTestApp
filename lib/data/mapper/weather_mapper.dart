import 'package:merck_test_app/data/data.dart';
import 'package:merck_test_app/domain/domain.dart';
import 'package:merck_test_app/utils/utils.dart';

class WeatherMapper extends EntityMapper<WeatherEntity> {
  final WeatherDto dto;
  final LocationEntity location;

  WeatherMapper({required this.dto, required this.location});

  @override
  WeatherEntity toEntity() => WeatherEntity(
        description: dto.description,
        temperature: dto.temperature,
        location: location,
      );
}
