import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather/data/location_reposiory.dart';
import 'package:weather/domain/notifiers/location_state.dart';

final locationStateProvider =
    StateNotifierProvider<LocationStateNotifier, LocationState>((ref) =>
        LocationStateNotifier(
            ref.watch(locationRepositoryProvider)..getLocation()));

class LocationStateNotifier extends StateNotifier<LocationState> {
  final LocationRepository _locationRepository;

  LocationStateNotifier(this._locationRepository)
      : super(LocationState.initial());

  void getLocation() async {
    if (state.whenOrNull(
          loading: (_) => true,
        ) ==
        true) {
      return;
    }
    state = LocationState.loading(
      state.maybeWhen(
        loaded: (location) => location,
        orElse: () {
          return List.empty();
        },
      ),
    );
    final result = await _locationRepository.getLocation();
    result.fold(
      (error) => state = LocationState.error(error),
      (location) => state = LocationState.loaded(
        state.maybeWhen(
          loading: (location) => location + location,
          orElse: () {
            return location;
          },
        ),
      ),
    );
  }
}
