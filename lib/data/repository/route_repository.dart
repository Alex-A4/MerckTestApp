import 'package:dio/dio.dart';
import 'package:merck_test_app/const/const.dart';
import 'package:merck_test_app/data/data.dart';

class RouteRepository {
  final Dio dio;

  RouteRepository({required this.dio});

  Future<RouteDto> getRoute({required String cityFrom, required String cityTo}) async {
    final response = await dio.get(Urls.routePath(from: cityFrom, to: cityTo));

    final statusCode = response.statusCode ?? 404;

    if (statusCode >= 200 && statusCode < 300) {
      final json = response.data as Map<String, dynamic>;

      return RouteDto.fromJson(json);
    }

    throw NetworkException();
  }
}
