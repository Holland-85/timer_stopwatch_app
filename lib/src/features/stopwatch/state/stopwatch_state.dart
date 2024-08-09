import 'dart:async';
import 'package:flutter/material.dart';

class StopwatchState extends ChangeNotifier {
  int elapsedTime = 0;
  bool isStopwatchRunning = false;

  Future<void> startStopwatch() async {
    if (!isStopwatchRunning) {
      isStopwatchRunning = true;
      while (isStopwatchRunning) {
        await Future.delayed(const Duration(milliseconds: 100));
        elapsedTime += 100;
        notifyListeners();
      }
    }
  }

  void stopStopwatch() {
    if (isStopwatchRunning) {
      isStopwatchRunning = false;
      notifyListeners();
    }
  }

  void resetStopwatch() {
    stopStopwatch();
    elapsedTime = 0;
    notifyListeners();
  }
}
