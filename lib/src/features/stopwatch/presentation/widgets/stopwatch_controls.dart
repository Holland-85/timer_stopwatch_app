import 'package:flutter/material.dart';
import '../../state/stopwatch_state.dart';

class StopwatchControls extends StatelessWidget {
  final StopwatchState stopwatchState;

  const StopwatchControls({super.key, required this.stopwatchState});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedButton(
          onPressed: stopwatchState.startStopwatch,
          child: const Text('Starten'),
        ),
        ElevatedButton(
          onPressed: stopwatchState.stopStopwatch,
          child: const Text('Stoppen'),
        ),
        ElevatedButton(
          onPressed: stopwatchState.resetStopwatch,
          child: const Text('Zurücksetzen'),
        ),
      ],
    );
  }
}
