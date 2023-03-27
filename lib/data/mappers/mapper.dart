import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather/data/model/model.dart';

typedef EntityMapper<Entity, Response> = Entity Function(Response);

final weatherEntityMapperProvider =
    Provider<EntityMapper<WeatherResponse, WeatherResponse>>(
  ((ref) => (response) => WeatherResponse(
      response.country,
      response.condition,
      response.icon,
      response.name,
      response.temp_c,
      response.text,
      response.localtime)),
);
