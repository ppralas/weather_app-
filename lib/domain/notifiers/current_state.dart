import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:weather/domain/entities/failure.dart';
import 'package:flutter/foundation.dart';

import '../entities/current.dart';

part 'current_state.freezed.dart';

@freezed
class CurrentState with _$CurrentState {
  const factory CurrentState.initial() = _Initial;
  const factory CurrentState.loading(List<Current> current) = _Loading;
  const factory CurrentState.error(Failure failure) = _Error;
  const factory CurrentState.loaded(List<Current> current) = _Loaded;
}
