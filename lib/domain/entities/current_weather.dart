import 'package:equatable/equatable.dart';
import 'package:weather/domain/entities/condition.dart';

class CurrentWeather extends Equatable {
  final String temp_c;
  final List<Condition> condition;

  CurrentWeather(this.temp_c, this.condition);

  @override
  List<Object?> get props => [temp_c, condition];
}
