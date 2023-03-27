import 'package:json_annotation/json_annotation.dart';

part 'model.g.dart';

@JsonSerializable()
class WeatherResponse {
  final String name;
  final String country;
  final String localtime;
  final String text;
  final String icon;

  final String temp_c;
  final String condition;

  WeatherResponse(
    this.temp_c,
    this.condition,
    this.name,
    this.country,
    this.localtime,
    this.text,
    this.icon,
  );

  factory WeatherResponse.fromJson(Map<String, dynamic> json) =>
      _$WeatherResponseFromJson(json);
}
