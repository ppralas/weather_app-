import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather/data/model/response/current_response.dart';
import 'package:weather/domain/entities/current.dart';

typedef EntityMapper<Entity, Response> = Entity Function(Response);

final currentEntityMapper = Provider<EntityMapper<Current, CurrentResponse>>(
  ((ref) => (response) => Current(response.temp_c)),
);
