import 'package:merck_test_app/domain/domain.dart';

abstract class RouteService {
  /// Get route information between to cities
  Future<RouteEntity> getRoute({required String cityFrom, required String cityTo});
}
