import 'dart:async';

import 'package:flutter/material.dart';
import 'package:timer_stopwatch_app/src/features/stopwatch/presentation/pages/stopwatch_page.dart';
import 'package:timer_stopwatch_app/src/features/timer/presentation/pages/timer_page.dart';

void main() {
  runApp(const TimerStopwatchApp());
}

class TimerStopwatchApp extends StatelessWidget {
  const TimerStopwatchApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Timer & Stoppuhr',
      theme: ThemeData(),
      home: const TimerStopwatchHomePage(),
    );
  }
}

class TimerStopwatchHomePage extends StatefulWidget {
  const TimerStopwatchHomePage({super.key});

  @override
  TimerStopwatchHomePageState createState() => TimerStopwatchHomePageState();
}

class TimerStopwatchHomePageState extends State<TimerStopwatchHomePage> {
  Color color1 = Colors.blue;
  Color color2 = Colors.red;
  late Timer timer;

  @override
  void initState() {
    super.initState();
    startBackgroundAnimation();
  }

  void startBackgroundAnimation() {
    timer = Timer.periodic(const Duration(seconds: 2), (Timer t) {
      setState(() {
        color1 = (color1 == Colors.blue) ? Colors.purple : Colors.green;
        color2 = (color2 == Colors.red) ? Colors.orange : Colors.blue;
      });
    });
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Timer & Stoppuhr'),
        backgroundColor: Colors.orange,
      ),
      body: AnimatedContainer(
        duration: const Duration(seconds: 3),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [color1, color2],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              build3DButton(
                label: 'Timer',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const TimerPage()),
                  );
                },
              ),
              const SizedBox(height: 40),
              build3DButton(
                label: 'Stoppuhr',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const StopwatchPage()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget build3DButton({required String label, required VoidCallback onPressed}) {
    return Container(
      width: 150.0,
      height: 150.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Colors.orange.shade200,
            Colors.orange.shade800,
          ],
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.orange.shade900.withOpacity(0.5),
            offset: const Offset(6, 6),
            blurRadius: 10,
          ),
          BoxShadow(
            color: Colors.white.withOpacity(0.7),
            offset: const Offset(-6, -6),
            blurRadius: 10,
          ),
        ],
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: const CircleBorder(),
          backgroundColor: Colors.transparent,
          padding: const EdgeInsets.all(20),
          shadowColor: Colors.transparent,
        ),
        onPressed: onPressed,
        child: Text(
          label,
          style: const TextStyle(fontSize: 20, color: Colors.black),
        ),
      ),
    );
  }
}
