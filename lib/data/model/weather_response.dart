import 'package:json_annotation/json_annotation.dart';

part 'weather_response.g.dart';

@JsonSerializable()
class WeatherResponse {
  final String name;
  final String country;
  final String localtime;
  final String temp_c;
  final String condition;

  WeatherResponse(
    this.temp_c,
    this.condition,
    this.name,
    this.country,
    this.localtime,
  );

  factory WeatherResponse.fromJson(Map<String, dynamic> json) =>
      _$WeatherResponseFromJson(json);
}
