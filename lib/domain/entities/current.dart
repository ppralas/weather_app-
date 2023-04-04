import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'current.g.dart';

@JsonSerializable()
class Current extends Equatable {
  final double temp_c;

  Current(this.temp_c);

  factory Current.fromJson(Map<String, dynamic> json) =>
      _$CurrentFromJson(json);

  factory Current.toJson(Map<String, dynamic> json) => _$CurrentFromJson(json);

  @override
  List<Object?> get props => [temp_c];
}
