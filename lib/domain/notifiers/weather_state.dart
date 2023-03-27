import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:weather/domain/entities/current_weather.dart';
import 'package:weather/domain/entities/failure.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'weather_state.freezed.dart';

@freezed
class WeatherState with _$WeatherState {
  const factory WeatherState.initial() = _Initial;
  const factory WeatherState.loading(List<CurrentWeather> weather) = _Loading;
  const factory WeatherState.error(Failure failure) = _Error;
  const factory WeatherState.loaded(List<CurrentWeather> weather) = _Loaded;
}
