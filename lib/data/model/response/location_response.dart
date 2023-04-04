import 'package:json_annotation/json_annotation.dart';

part 'location_response.g.dart';

@JsonSerializable()
class LocationResponse {
  final String name;
  final String country;
  final String localtime;

  LocationResponse(this.name, this.country, this.localtime);

  factory LocationResponse.fromJson(Map<String, dynamic> json) =>
      _$LocationResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LocationResponseToJson(this);
}
