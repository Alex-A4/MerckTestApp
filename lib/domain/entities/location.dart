import 'package:equatable/equatable.dart';

/// API ex: https://scrmobiletest.azurewebsites.net/api/route/netanya/herzelia
class LocationEntity with EquatableMixin {
  final double lat;
  final double lng;

  const LocationEntity({required this.lat, required this.lng});

  @override
  List<Object?> get props => [lat, lng];
}
