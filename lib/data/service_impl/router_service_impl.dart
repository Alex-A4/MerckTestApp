import 'package:merck_test_app/data/data.dart';
import 'package:merck_test_app/domain/domain.dart';

class RouteServiceImpl implements RouteService {
  final RouteRepository repository;

  RouteServiceImpl({required this.repository});

  @override
  Future<RouteEntity> getRoute({required String cityFrom, required String cityTo}) async {
    final route = await repository.getRoute(cityFrom: cityFrom, cityTo: cityTo);

    return RouteMapper(
      dto: route,
      cityFrom: cityFrom,
      cityTo: cityTo,
    ).toEntity();
  }
}
