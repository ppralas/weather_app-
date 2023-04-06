import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod/riverpod.dart';

import 'package:weather/data/current_repository.dart';
import 'package:weather/domain/notifiers/current_state.dart';

final currentStateProvider =
    StateNotifierProvider<CurrentStateNotifier, CurrentState>(
  (ref) => CurrentStateNotifier(
    ref.watch(currentRepositoryProvider)..getCurrent(),
  ),
);

class CurrentStateNotifier extends StateNotifier<CurrentState> {
  final CurrentRepository _currentRepository;

  CurrentStateNotifier(this._currentRepository) : super(CurrentState.initial());

  void getCurrent() async {
    if (state.whenOrNull(
          loading: (_) => true,
        ) ==
        true) return;

    state = CurrentState.loading(
      state.maybeWhen(
        loaded: (current) => current,
        orElse: () {
          return List.empty();
        },
      ),
    );
    final result = await _currentRepository.getCurrent();
    result.fold(
      (error) => state = CurrentState.error(error),
      (current) => state = CurrentState.loaded(
        state.maybeWhen(
          loading: (current) => current + current,
          orElse: () {
            return current;
          },
        ),
      ),
    );
  }
}
