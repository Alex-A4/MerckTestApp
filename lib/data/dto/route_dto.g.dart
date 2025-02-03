// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'route_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RouteDto _$RouteDtoFromJson(Map<String, dynamic> json) => RouteDto(
      distance: (json['distance'] as num).toDouble(),
      duration: (json['duration'] as num).toInt(),
      steps: (json['steps'] as List<dynamic>).map((e) => RouteStepDto.fromJson(e as Map<String, dynamic>)).toList(),
    );

Map<String, dynamic> _$RouteDtoToJson(RouteDto instance) => <String, dynamic>{
      'distance': instance.distance,
      'duration': instance.duration,
      'steps': instance.steps,
    };

RouteStepDto _$RouteStepDtoFromJson(Map<String, dynamic> json) => RouteStepDto(
      direction: json['direction'] as String?,
      location: LocationDto.fromJson(json['location'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RouteStepDtoToJson(RouteStepDto instance) => <String, dynamic>{
      'direction': instance.direction,
      'location': instance.location,
    };
