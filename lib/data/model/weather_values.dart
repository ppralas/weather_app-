import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:retrofit/http.dart';
import 'package:weather/data/model/model.dart';
import 'package:weather/domain/current_weather.dart';

part 'weather_values.g.dart';

final apiClient = Provider((ref) => WeatherValuesApiClient(Dio()));

@RestApi(baseUrl: 'https://weatherapi-com.p.rapidapi.com')
abstract class WeatherValuesApiClient {
  factory WeatherValuesApiClient(Dio dio, {String baseUrl}) =>
      _WeatherValuesApiClient;

  @GET('/location')
  Future<List<WeatherResponse>> getLocation();
//jel ovo jedan response ili trebam svaki dio jsona ovako parsirati?
  @GET('current/')
  Future<List<WeatherResponse>> getCurrent();
}
