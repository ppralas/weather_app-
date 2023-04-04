import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:weather/domain/entities/failure.dart';
import 'package:weather/domain/entities/location.dart';

part 'location_state.freezed.dart';

@freezed
class LocationState with _$LocationState {
  const factory LocationState.initial() = _Initial;
  const factory LocationState.loading(List<Location> location) = _Loading;
  const factory LocationState.error(Failure failure) = _Error;
  const factory LocationState.loaded(List<Location> location) = _Loaded;
}
