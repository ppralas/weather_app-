import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather/domain/entities/condition.dart';
import 'package:weather/domain/notifiers/condition_state_notifier.dart';

class ConditionListView extends ConsumerWidget {
  const ConditionListView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final conditionState = ref.watch(conditionStateProvider);

    return Scaffold(
      body: conditionState.when(
        initial: () => SizedBox(),
        loading: (List<Condition> condition) => ConditionWidget(
          condition: condition,
          isLoading: true,
        ),
        error: (error) {
          log(error.stackTrace.toString());
          return Text(error.error.toString());
        },
        loaded: (data) => ConditionWidget(
          condition: data,
          isLoading: true,
        ),
      ),
    );
  }
}

class ConditionWidget extends ConsumerWidget {
  final List<Condition> condition;
  final bool isLoading;

  const ConditionWidget({
    required this.condition,
    required this.isLoading,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      child: ListView.separated(
        itemBuilder: (BuildContext ctx, int index) {
          if (index == condition.length) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          final currentValue = condition[index];
          return Column(
            children: [
              Text(currentValue.icon),
              Text(currentValue.text),
            ],
          );
        },
        separatorBuilder: (BuildContext context, int index) => Divider(),
        itemCount: condition.length + (isLoading ? 1 : 0),
      ),
    );
  }
}
