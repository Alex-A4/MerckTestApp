import 'package:equatable/equatable.dart';
import 'package:merck_test_app/domain/domain.dart';

sealed class RouteState with EquatableMixin {
  const RouteState();
}

class InitialRouteState extends RouteState {
  const InitialRouteState();

  @override
  List<Object?> get props => [];
}

class RouteDataState extends RouteState {
  final RouteEntity route;

  const RouteDataState({required this.route});

  @override
  List<Object?> get props => [route];
}

class RouteErrorState extends RouteState {
  const RouteErrorState();

  @override
  List<Object?> get props => [];
}
