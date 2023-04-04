import 'package:json_annotation/json_annotation.dart';
import 'package:weather/domain/entities/condition.dart';

part 'current_response.g.dart';

@JsonSerializable()
class CurrentResponse {
  final double temp_c;
  final Condition condition;

  CurrentResponse(this.temp_c, this.condition);

  factory CurrentResponse.fromJson(Map<String, dynamic> json) =>
      _$CurrentResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CurrentResponseToJson(this);
}
