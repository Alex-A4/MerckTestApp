import 'package:flutter_test/flutter_test.dart';
import 'package:merck_test_app/data/data.dart';
import 'package:merck_test_app/domain/domain.dart';
import 'package:mocktail/mocktail.dart';

class RouteRepositoryMock extends Mock implements RouteRepository {}

void main() {
  const cityTo = 'herzelia';
  const cityFrom = 'netanya';

  late RouteRepositoryMock routeRepository;
  late RouteService routeService;

  setUp(() {
    routeRepository = RouteRepositoryMock();
    routeService = RouteServiceImpl(repository: routeRepository);
  });

  test('Test converting json data into entity', () async {
    when(() => routeRepository.getRoute(cityFrom: any(named: 'cityFrom'), cityTo: any(named: 'cityTo'))).thenAnswer(
      (_) => Future.value(RouteDto.fromJson(routeData)),
    );

    final route = await routeService.getRoute(cityTo: cityTo, cityFrom: cityFrom);

    expect(route.cityFrom, cityFrom);
    expect(route.cityTo, cityTo);
    expect(route.distance, 21814.0);
    expect(route.duration, const Duration(minutes: 1579));
    expect(route.steps.length, 18);

    //random comparing
    expect(route.steps[0].location, const LocationEntity(lat: 32.3215054, lng: 34.8529733));
    expect(route.steps[0].direction, null);

    expect(route.steps[9].location, const LocationEntity(lat: 32.2270206, lng: 34.8314934));
    expect(route.steps[9].direction, 'keep-left');

    expect(route.steps[15].location, const LocationEntity(lat: 32.163865, lng: 34.8522378));
    expect(route.steps[15].direction, 'turn-right');
  });
}

final routeData = {
  "duration": 1579,
  "distance": 21814,
  "steps": [
    {
      "direction": null,
      "location": {"lat": 32.3215054, "lng": 34.8529733}
    },
    {
      "direction": "turn-left",
      "location": {"lat": 32.3217963, "lng": 34.85306}
    },
    {
      "direction": "turn-left",
      "location": {"lat": 32.322078, "lng": 34.8517896}
    },
    {
      "direction": "roundabout-right",
      "location": {"lat": 32.3190152, "lng": 34.8508924}
    },
    {
      "direction": "turn-left",
      "location": {"lat": 32.3195869, "lng": 34.8481707}
    },
    {
      "direction": "roundabout-right",
      "location": {"lat": 32.3054392, "lng": 34.846063}
    },
    {
      "direction": "ramp-right",
      "location": {"lat": 32.2756639, "lng": 34.8517584}
    },
    {
      "direction": null,
      "location": {"lat": 32.2390202, "lng": 34.833308}
    },
    {
      "direction": null,
      "location": {"lat": 32.2384244, "lng": 34.8331712}
    },
    {
      "direction": "keep-left",
      "location": {"lat": 32.2270206, "lng": 34.8314934}
    },
    {
      "direction": "ramp-right",
      "location": {"lat": 32.1998229, "lng": 34.8316363}
    },
    {
      "direction": "ramp-right",
      "location": {"lat": 32.1807514, "lng": 34.8487634}
    },
    {
      "direction": "turn-right",
      "location": {"lat": 32.1791746, "lng": 34.8516864}
    },
    {
      "direction": "roundabout-right",
      "location": {"lat": 32.1658648, "lng": 34.8529017}
    },
    {
      "direction": "roundabout-right",
      "location": {"lat": 32.165382, "lng": 34.850944}
    },
    {
      "direction": "turn-right",
      "location": {"lat": 32.163865, "lng": 34.8522378}
    },
    {
      "direction": "roundabout-right",
      "location": {"lat": 32.1624676, "lng": 34.8453115}
    },
    {
      "direction": "turn-left",
      "location": {"lat": 32.162695, "lng": 34.84458}
    }
  ]
};
