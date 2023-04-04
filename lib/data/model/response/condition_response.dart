import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'condition_response.g.dart';

@JsonSerializable()
class ConditionResponse {
  final String text;
  final String icon;

  factory ConditionResponse.fromJson(Map<String, dynamic> json) =>
      _$ConditionResponseFromJson(json);

  ConditionResponse(this.text, this.icon);

  Map<String, dynamic> toJson() => _$ConditionResponseToJson(this);
}
