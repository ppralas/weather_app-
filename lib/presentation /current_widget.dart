import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather/domain/entities/current.dart';
import 'package:weather/domain/notifiers/current_state_notifier.dart';

class CurrentListView extends ConsumerWidget {
  const CurrentListView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentState = ref.watch(currentStateProvider);

    return Scaffold(
      body: currentState.when(
        initial: () => SizedBox(),
        loading: (List<Current> current) => CurrentWidget(
          current: current,
          isLoading: true,
        ),
        error: (error) {
          log(error.stackTrace.toString());
          return Text(error.error.toString());
        },
        loaded: (data) => CurrentWidget(
          current: data,
          isLoading: true,
        ),
      ),
    );
  }
}

class CurrentWidget extends ConsumerWidget {
  final List<Current> current;
  final bool isLoading;

  const CurrentWidget({
    required this.current,
    required this.isLoading,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      child: ListView.separated(
        itemBuilder: (BuildContext ctx, int index) {
          if (index == current.length) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          final currentValue = current[index];
          return Column(
            children: [
              Text(currentValue.temp_c.toString()),
            ],
          );
        },
        separatorBuilder: (BuildContext context, int index) => Divider(),
        itemCount: current.length + (isLoading ? 1 : 0),
      ),
    );
  }
}
