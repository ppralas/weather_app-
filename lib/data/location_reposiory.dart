import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather/data/mappers/location_mapper.dart';
import 'package:weather/data/model/api/api_client.dart';
import 'package:weather/data/model/response/location_response.dart';
import 'package:weather/domain/entities/failure.dart';

import '../domain/entities/location.dart';

final locationRepositoryProvider = Provider((ref) => WeatherRepositoryImpl(
    ref.watch(apiClient), ref.watch(locationEntityMapperProvider)));

abstract class LocationRepository {
  Future<Either<Failure, List<Location>>> getLocation();
}

class WeatherRepositoryImpl implements LocationRepository {
  final WeatherValuesApiClient weatherApi;
  final EntityMapper<Location, LocationResponse> mapper;

  WeatherRepositoryImpl(this.weatherApi, this.mapper);

  @override
  Future<Either<Failure, List<Location>>> getLocation() async {
    try {
      final location = await weatherApi.getLocation();
      return right(location.map((e) => mapper(e)).toList());
    } catch (error, StackTrace) {
      return left(Failure(error, StackTrace));
    }
  }
}
