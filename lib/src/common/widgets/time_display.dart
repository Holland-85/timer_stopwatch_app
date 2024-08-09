import 'package:flutter/material.dart';

class TimeDisplay extends StatelessWidget {
  final int time; // Zeit in Millisekunden

  const TimeDisplay({super.key, required this.time});

  @override
  Widget build(BuildContext context) {
    final minutes = (time ~/ 60000).toString().padLeft(2, '0');
    final seconds = ((time ~/ 1000) % 60).toString().padLeft(2, '0');
    final milliseconds = ((time % 1000) ~/ 10).toString().padLeft(2, '0');

    return Text(
      '$minutes:$seconds:$milliseconds',
      style: const TextStyle(fontSize: 32),
    );
  }
}
