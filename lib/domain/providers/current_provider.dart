import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather/data/current_repository.dart';

final currentProvider = FutureProvider((ref) async {
  return ref.watch(currentRepositoryProvider);
});
