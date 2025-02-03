import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:logging/logging.dart';
import 'package:merck_test_app/domain/domain.dart';
import 'package:merck_test_app/features/result_feature/route_bloc/route_bloc.dart';

class RouteBloc extends Bloc<RouteEvent, RouteState> {
  final _log = Logger('RouteBloc');

  RouteBloc({
    required this.service,
    required this.cityFrom,
    required this.cityTo,
  }) : super(const InitialRouteState()) {
    on<InitRouteEvent>(_initRoute);
  }

  final RouteService service;
  final String cityFrom;
  final String cityTo;

  FutureOr<void> _initRoute(InitRouteEvent event, Emitter<RouteState> emit) async {
    try {
      final route = await service.getRoute(cityFrom: cityFrom, cityTo: cityTo);

      emit(RouteDataState(route: route));
    } catch (e, t) {
      _log.severe('_initRoute', e, t);
      emit(const RouteErrorState());
    }
  }
}
