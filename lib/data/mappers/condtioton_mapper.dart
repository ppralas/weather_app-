import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather/data/model/response/condition_response.dart';
import 'package:weather/domain/entities/condition.dart';

typedef EntityMapper<Entity, Response> = Entity Function(Response);

final conditionEntityMapper =
    Provider<EntityMapper<Condition, ConditionResponse>>(
  ((ref) => (response) => Condition(
        response.icon,
        response.text,
      )),
);
