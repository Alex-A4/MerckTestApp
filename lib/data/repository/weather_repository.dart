import 'package:dio/dio.dart';
import 'package:merck_test_app/const/const.dart';
import 'package:merck_test_app/data/data.dart';
import 'package:merck_test_app/domain/domain.dart';

class WeatherRepository {
  final Dio dio;

  WeatherRepository({required this.dio});

  Future<WeatherDto> getWeather(LocationEntity location) async {
    final response = await dio.get(Urls.weatherPath(lat: location.lat, lng: location.lng));

    final statusCode = response.statusCode ?? 404;

    if (statusCode >= 200 && statusCode < 300) {
      final json = response.data as Map<String, dynamic>;

      return WeatherDto.fromJson(json);
    }

    throw NetworkException();
  }
}
