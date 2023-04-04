// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'current_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CurrentResponse _$CurrentResponseFromJson(Map<String, dynamic> json) =>
    CurrentResponse(
      (json['temp_c'] as num).toDouble(),
      Condition.fromJson(json['condition'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CurrentResponseToJson(CurrentResponse instance) =>
    <String, dynamic>{
      'temp_c': instance.temp_c,
      'condition': instance.condition,
    };
