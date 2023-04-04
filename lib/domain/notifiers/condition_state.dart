import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:weather/domain/entities/condition.dart';
import 'package:weather/domain/entities/failure.dart';

part 'condition_state.freezed.dart';

@freezed
class ConditionState with _$ConditionState {
  const factory ConditionState.initial() = _Initial;
  const factory ConditionState.loading(List<Condition> current) = _Loading;
  const factory ConditionState.error(Failure failure) = _Error;
  const factory ConditionState.loaded(List<Condition> condition) = _Loaded;
}
