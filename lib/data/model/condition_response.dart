import 'package:json_annotation/json_annotation.dart';

part 'condition_response.g.dart';

@JsonSerializable()
class ConditionResponse {
  final String text;
  final String icon;

  ConditionResponse(this.text, this.icon);

  factory ConditionResponse.fromJson(Map<String, dynamic> json) =>
      _$ConditionResponseFromJson(json);
}
