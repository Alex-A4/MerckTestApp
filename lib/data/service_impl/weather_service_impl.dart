import 'package:merck_test_app/data/data.dart';
import 'package:merck_test_app/domain/domain.dart';

class WeatherServiceImpl implements WeatherService {
  final WeatherRepository repository;

  WeatherServiceImpl({required this.repository});

  @override
  Future<WeatherEntity> getWeather(LocationEntity location) async {
    final weather = await repository.getWeather(location);

    return WeatherMapper(dto: weather, location: location).toEntity();
  }
}
