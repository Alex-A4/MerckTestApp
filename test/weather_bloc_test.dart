import 'package:flutter_test/flutter_test.dart';
import 'package:merck_test_app/const/network.dart';
import 'package:merck_test_app/domain/domain.dart';
import 'package:merck_test_app/features/result_feature/result_feature.dart';
import 'package:mocktail/mocktail.dart';
import 'package:bloc_test/bloc_test.dart';

class MockWeatherService extends Mock implements WeatherService {}

void main() {
  late WeatherService service;

  const location = LocationEntity(lat: 32, lng: 33);
  const weather = WeatherEntity(description: '123', location: location, temperature: 23.0);

  setUp(() {
    service = MockWeatherService();
    registerFallbackValue(location);
    registerFallbackValue(weather);
  });

  group('RouteBloc', () {
    test('Initial state', () {
      final bloc = WeatherBloc(service: service);
      expect(bloc.state, const InitialWeatherState());
    });

    blocTest(
      'Emits error if loading failed',
      build: () => WeatherBloc(service: service),
      act: (bloc) {
        when(
          () => service.getWeather(any()),
        ).thenThrow(NetworkException());

        bloc.add(InitWeatherEvent(location));
      },
      expect: () => [const ErrorWeatherState()],
    );

    blocTest(
      'Provides data',
      build: () => WeatherBloc(service: service),
      act: (bloc) {
        when(
          () => service.getWeather(any()),
        ).thenAnswer((_) => Future.value(weather));

        bloc.add(InitWeatherEvent(location));
      },
      expect: () => [const DataWeatherState(weather: weather)],
    );
  });
}
