import 'dart:async';
import 'package:flutter/material.dart';

class TimerState extends ChangeNotifier {
  int timerDuration = 0;
  int remainingTime = 0;
  bool isTimerRunning = false;

  void setTimerDuration(int duration) {
    timerDuration = duration;
    remainingTime = duration;
    notifyListeners();
  }

  Future<void> startTimer(BuildContext context) async {
    if (!isTimerRunning && timerDuration > 0) {
      isTimerRunning = true;
      while (remainingTime > 0) {
        await Future.delayed(const Duration(seconds: 1));
        remainingTime--;
        notifyListeners();
      }
      isTimerRunning = false;
      notifyListeners();

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Timer abgelaufen!'),
          backgroundColor: Colors.green,
        ),
      );
    }
  }

  void stopTimer() {
    if (isTimerRunning) {
      isTimerRunning = false;
      notifyListeners();
    }
  }
}
