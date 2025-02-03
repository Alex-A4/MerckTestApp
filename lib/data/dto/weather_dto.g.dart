// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherDto _$WeatherDtoFromJson(Map<String, dynamic> json) => WeatherDto(
      description: json['description'] as String,
      temperature: (json['temperature'] as num).toDouble(),
    );

Map<String, dynamic> _$WeatherDtoToJson(WeatherDto instance) => <String, dynamic>{
      'description': instance.description,
      'temperature': instance.temperature,
    };
