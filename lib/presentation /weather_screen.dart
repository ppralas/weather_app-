import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather/presentation%20/condition_widget.dart';
import 'package:weather/presentation%20/current_widget.dart';
import 'package:weather/presentation%20/location_widget.dart';

class WeatherScreen extends ConsumerWidget {
  const WeatherScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Row(
        children: [
          LocationListView(),
          ConditionListView(),
          CurrentListView(),
        ],
      ),
    );
  }
}
