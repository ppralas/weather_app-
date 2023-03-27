import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather/data/model/model.dart';

typedef EntityMapper<Entity, Response> = Entity Function(Response); 

final weatherEntityMapperProvider = Provider<EntityMapper<Weather, WeatherResponse>>(((ref) => (response) => Weather(response.)));