import 'dart:async';

import 'package:flutter/material.dart';
import '../../state/timer_state.dart';
import '../../../../common/widgets/time_display.dart';
import '../widgets/skateboard_animation.dart';

class TimerPage extends StatefulWidget {
  const TimerPage({super.key});

  @override
  TimerPageState createState() => TimerPageState();
}

class TimerPageState extends State<TimerPage> with SingleTickerProviderStateMixin {
  final TimerState timerState = TimerState();
  Color backgroundColor = Colors.white;

  late AnimationController controller;
  late Animation<double> animation;
  Timer? timer;

  @override
  void initState() {
    super.initState();
    startBackgroundAnimation();

    controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    animation = Tween<double>(begin: -200, end: 750).animate(controller)
      ..addListener(() {
        setState(() {});
      });
  }

  void startBackgroundAnimation() {
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        backgroundColor = backgroundColor == Colors.white ? Colors.blueGrey[100]! : Colors.white;
      });
      startBackgroundAnimation();
    });
  }

  void startSkateboardAnimation() {
    controller.repeat(reverse: true);
  }

  void stopSkateboardAnimation() {
    controller.stop();
  }

  void startTimer() {
    if (timerState.remainingTime > 0) {
      startSkateboardAnimation();
      timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        setState(() {
          if (timerState.remainingTime > 1) {
            timerState.setTimerDuration(timerState.remainingTime - 1);
          } else {
            timerState.setTimerDuration(0);
            stopSkateboardAnimation();
            timer.cancel();
          }
        });
      });
    }
  }

  void stopTimer() {
    timer?.cancel();
    stopSkateboardAnimation();
  }

  @override
  void dispose() {
    controller.dispose();
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Timer'),
        backgroundColor: Colors.orange,
      ),
      body: AnimatedContainer(
        duration: const Duration(seconds: 1),
        color: backgroundColor,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              decoration: const InputDecoration(
                hintText: 'Timer-Dauer in Sekunden eingeben',
              ),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                timerState.setTimerDuration(int.tryParse(value) ?? 0);
              },
            ),
            const SizedBox(height: 10),
            AnimatedBuilder(
              animation: timerState,
              builder: (context, child) {
                return TimeDisplay(time: timerState.remainingTime);
              },
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: startTimer,
                  child: const Text('Starten'),
                ),
                const SizedBox(width: 20),
                ElevatedButton(
                  onPressed: stopTimer,
                  child: const Text('Stoppen'),
                ),
              ],
            ),
            const SizedBox(height: 20),
            SkateboardAnimation(animation: animation),
          ],
        ),
      ),
    );
  }
}
