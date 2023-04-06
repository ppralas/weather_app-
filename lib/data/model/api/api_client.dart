import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:retrofit/http.dart';
import 'package:weather/data/model/response/condition_response.dart';
import 'package:weather/data/model/response/current_response.dart';
import 'package:weather/data/model/response/location_response.dart';

part 'api_client.g.dart';

final apiClient = Provider(
  (ref) => WeatherValuesApiClient(
    Dio()
      ..interceptors.add(
        TokenInterceptor(),
      ),
  ),
);

@RestApi(baseUrl: 'https://weatherapi-com.p.rapidapi.com')
abstract class WeatherValuesApiClient {
  factory WeatherValuesApiClient(Dio dio, {String baseUrl}) =
      _WeatherValuesApiClient;

  @GET('/location')
  Future<List<LocationResponse>> getLocation();
  @GET('/current')
  Future<List<CurrentResponse>> getCurrent();
  @GET('/condition')
  Future<List<ConditionResponse>> getCondition();
}

class TokenInterceptor extends QueuedInterceptor {
  @override
  Future onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    options.responseType = ResponseType.json;
    options.headers.addEntries(
      const [
        MapEntry<String, String>(
          'X-RapidAPI-Key',
          '7d72957525msh0a3476e8238d3c2p12c493jsne6832b801c90',
        ),
        MapEntry<String, String>(
          'X-RapidAPI-Host',
          'weatherapi-com.p.rapidapi.com',
        ),
      ],
    );
    super.onRequest(options, handler);
  }
}
