import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather/data/condition_repository.dart';

final conditionProvider = FutureProvider((ref) async {
  return ref.watch(conditionRepositoryProvider);
});
