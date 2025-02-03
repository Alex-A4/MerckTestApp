import 'package:flutter_test/flutter_test.dart';
import 'package:merck_test_app/const/network.dart';
import 'package:merck_test_app/domain/domain.dart';
import 'package:merck_test_app/features/result_feature/result_feature.dart';
import 'package:mocktail/mocktail.dart';
import 'package:bloc_test/bloc_test.dart';

class MockRouteService extends Mock implements RouteService {}

void main() {
  late RouteService service;

  const route = RouteEntity(
    distance: 1,
    duration: Duration(minutes: 200),
    steps: [],
    cityFrom: 'netanya',
    cityTo: 'herzelia',
  );

  setUp(() {
    service = MockRouteService();
  });

  group('RouteBloc', () {
    test('Initial state', () {
      final bloc = RouteBloc(service: service, cityFrom: 'netanya', cityTo: 'herzelia');
      expect(bloc.state, const InitialRouteState());
    });

    blocTest(
      'Emits error if loading failed',
      build: () => RouteBloc(service: service, cityFrom: 'netanya', cityTo: 'herzelia'),
      act: (bloc) {
        when(
          () => service.getRoute(cityFrom: any(named: 'cityFrom'), cityTo: any(named: 'cityTo')),
        ).thenThrow(NetworkException());

        bloc.add(InitRouteEvent());
      },
      expect: () => [const RouteErrorState()],
    );

    blocTest(
      'Provides data',
      build: () => RouteBloc(service: service, cityFrom: 'netanya', cityTo: 'herzelia'),
      act: (bloc) {
        when(
          () => service.getRoute(cityFrom: any(named: 'cityFrom'), cityTo: any(named: 'cityTo')),
        ).thenAnswer((_) => Future.value(route));

        bloc.add(InitRouteEvent());
      },
      expect: () => [const RouteDataState(route: route)],
    );
  });
}
