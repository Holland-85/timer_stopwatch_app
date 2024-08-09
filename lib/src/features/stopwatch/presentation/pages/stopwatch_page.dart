import 'package:flutter/material.dart';
import '../../state/stopwatch_state.dart';
import '../widgets/stopwatch_controls.dart';
import '../../../../common/widgets/time_display.dart';

class StopwatchPage extends StatefulWidget {
  const StopwatchPage({super.key});

  @override
  StopwatchPageState createState() => StopwatchPageState();
}

class StopwatchPageState extends State<StopwatchPage> {
  final StopwatchState stopwatchState = StopwatchState();
  Color backgroundColor = Colors.white;

  @override
  void initState() {
    super.initState();
    startBackgroundAnimation();
  }

  void startBackgroundAnimation() {
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        backgroundColor = backgroundColor == Colors.white ? Colors.blueGrey[100]! : Colors.white;
      });
      startBackgroundAnimation();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stoppuhr'),
        backgroundColor: Colors.orange,
      ),
      body: AnimatedContainer(
        duration: const Duration(seconds: 1),
        color: backgroundColor,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            AnimatedBuilder(
              animation: stopwatchState,
              builder: (context, child) {
                return TimeDisplay(time: stopwatchState.elapsedTime);
              },
            ),
            const SizedBox(height: 10),
            StopwatchControls(stopwatchState: stopwatchState),
          ],
        ),
      ),
    );
  }
}
