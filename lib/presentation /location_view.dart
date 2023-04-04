import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather/domain/entities/location.dart';
import 'package:weather/domain/notifiers/location_state_notifier.dart';

class LocationListView extends ConsumerWidget {
  const LocationListView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locationState = ref.watch(locationStateProvider);

    return Scaffold(
      body: locationState.when(
        initial: () => SizedBox(),
        loading: (List<Location> location) =>
            LocationView(location: location, isLoading: true),
        error: (error) {
          log(error.stackTrace.toString());
          return Text(error.error.toString());
        },
        loaded: (data) => LocationView(location: data, isLoading: true),
      ),
    );
  }
}

class LocationView extends ConsumerWidget {
  final List<Location> location;
  final bool isLoading;

  const LocationView({
    required this.location,
    required this.isLoading,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      child: ListView.separated(
        itemBuilder: (BuildContext ctx, int index) {
          if (index == location.length) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          final locationValue = location[index];
          return Column(
            children: [
              Text(locationValue.country),
              Text(locationValue.name),
              Text(locationValue.localtime),
            ],
          );
        },
        separatorBuilder: (BuildContext context, int index) => Divider(),
        itemCount: location.length + (isLoading ? 1 : 0),
      ),
    );
  }
}
