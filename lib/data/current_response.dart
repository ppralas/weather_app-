import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather/data/mappers/current_mapper.dart';
import 'package:weather/data/model/api/api_client.dart';
import 'package:weather/data/model/response/current_response.dart';
import 'package:weather/domain/entities/current.dart';
import 'package:weather/domain/entities/failure.dart';

final currentRepositoryProvider = Provider((ref) => CurrentRepositoryImpl(
      ref.watch(apiClient),
      ref.watch(currentEntityMapper),
    ));

abstract class CurrentRepository {
  Future<Either<Failure, List<Current>>> getCurrent();
}

class CurrentRepositoryImpl implements CurrentRepository {
  final WeatherValuesApiClient weatherApi;
  final EntityMapper<Current, CurrentResponse> mapper;

  CurrentRepositoryImpl(this.weatherApi, this.mapper);

  @override
  Future<Either<Failure, List<Current>>> getCurrent() async {
    try {
      final current = await weatherApi.getCurrent();
      return right(current.map((e) => mapper(e)).toList());
    } catch (error, StackTrace) {
      return left(Failure(error, StackTrace));
    }
  }
}
