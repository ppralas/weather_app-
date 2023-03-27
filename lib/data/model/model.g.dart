// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherResponse _$WeatherResponseFromJson(Map<String, dynamic> json) =>
    WeatherResponse(
      json['temp_c'] as String,
      json['condition'] as String,
      json['name'] as String,
      json['country'] as String,
      json['localtime'] as String,
      json['text'] as String,
      json['icon'] as String,
    );

Map<String, dynamic> _$WeatherResponseToJson(WeatherResponse instance) =>
    <String, dynamic>{
      'name': instance.name,
      'country': instance.country,
      'localtime': instance.localtime,
      'text': instance.text,
      'icon': instance.icon,
      'temp_c': instance.temp_c,
      'condition': instance.condition,
    };
