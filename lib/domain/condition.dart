import 'package:equatable/equatable.dart';

class Condition extends Equatable {
  final String text;
  final String icon;

  Condition(this.text, this.icon);

  @override
  List<Object?> get props => [text, icon];
}
