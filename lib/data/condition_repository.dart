import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather/data/mappers/condtioton_mapper.dart';
import 'package:weather/data/model/api/api_client.dart';
import 'package:weather/data/model/response/condition_response.dart';
import 'package:weather/domain/entities/condition.dart';
import 'package:weather/domain/entities/current.dart';
import 'package:weather/domain/entities/failure.dart';

final conditionRepositoryProvider = Provider((ref) => ConditionRepositoryImpl(
      ref.watch(apiClient),
      ref.watch(conditionEntityMapper),
    ));

abstract class ConditionRepository {
  Future<Either<Failure, List<Condition>>> getCondition();
}

class ConditionRepositoryImpl implements ConditionRepository {
  final WeatherValuesApiClient weatherApi;
  final EntityMapper<Condition, ConditionResponse> conditionMapper;

  ConditionRepositoryImpl(this.weatherApi, this.conditionMapper);

  @override
  Future<Either<Failure, List<Condition>>> getCondition() async {
    try {
      final condition = await weatherApi.getCondition();
      return right(condition.map((e) => conditionMapper(e)).toList());
    } catch (error, StackTrace) {
      return left(Failure(error, StackTrace));
    }
  }
}
