import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather/data/current_response.dart';

final currentProvider = FutureProvider((ref) async {
  return ref.watch(weatherRepositoryProvider);
});
