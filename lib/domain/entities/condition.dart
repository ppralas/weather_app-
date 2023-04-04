import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'condition.g.dart';

@JsonSerializable()
class Condition extends Equatable {
  final String text;
  final String icon;

  Condition(this.text, this.icon);

  factory Condition.fromJson(Map<String, dynamic> json) =>
      _$ConditionFromJson(json);

  @override
  List<Object?> get props => [text, icon];
}
