import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather/data/condition_repository.dart';
import 'package:weather/domain/notifiers/condition_state.dart';

final conditionStateProvider =
    StateNotifierProvider<ConditionStateNotifier, ConditionState>(
  (ref) => ConditionStateNotifier(
    ref.watch(conditionRepositoryProvider)..getCondition(),
  ),
);

class ConditionStateNotifier extends StateNotifier<ConditionState> {
  final ConditionRepository _conditionRepository;

  ConditionStateNotifier(this._conditionRepository)
      : super(ConditionState.initial());

  void getCondition() async {
    if (state.whenOrNull(
          loading: (_) => true,
        ) ==
        true) return;

    state = ConditionState.loading(
      state.maybeWhen(
        loading: (condition) => condition,
        orElse: () {
          return List.empty();
        },
      ),
    );
    final result = await _conditionRepository.getCondition();
    result.fold(
      (error) => state = ConditionState.error(error),
      (condition) => state = ConditionState.loaded(
        state.maybeWhen(
          loading: (condition) => condition + condition,
          orElse: () {
            return condition;
          },
        ),
      ),
    );
  }
}
