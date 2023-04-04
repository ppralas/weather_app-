import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather/data/location_reposiory.dart';

final locationProvider = FutureProvider((ref) async {
  return ref.watch(locationRepositoryProvider);
});
