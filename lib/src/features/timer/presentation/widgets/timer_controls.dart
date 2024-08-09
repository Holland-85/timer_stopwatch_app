import 'package:flutter/material.dart';
import '../../state/timer_state.dart';

class TimerControls extends StatelessWidget {
  final TimerState timerState;

  const TimerControls(
      {super.key, required this.timerState, required void Function() onStart, required void Function() onStop});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedButton(
          onPressed: () => timerState.startTimer(context),
          child: const Text('Starten'),
        ),
        ElevatedButton(
          onPressed: timerState.stopTimer,
          child: const Text('Stoppen'),
        ),
      ],
    );
  }
}
