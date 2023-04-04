import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather/data/model/response/location_response.dart';
import 'package:weather/domain/entities/location.dart';

typedef EntityMapper<Entity, Response> = Entity Function(Response);

final locationEntityMapperProvider =
    Provider<EntityMapper<Location, LocationResponse>>(
  ((ref) => (response) => Location(
        response.country,
        response.name,
        response.localtime,
      )),
);
