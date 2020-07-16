import 'package:flutter/material.dart';

class CircleTimer extends StatefulWidget {
  final int time;

  CircleTimer({@required this.time});

  @override
  _CircleTimerState createState() => _CircleTimerState();
}

class _CircleTimerState extends State<CircleTimer> {
  @override
  Widget build(BuildContext context) {
    return Text(widget.time.toString());
  }
}
