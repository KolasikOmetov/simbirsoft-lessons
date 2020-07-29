import 'package:flutter/material.dart';
import 'package:simbirsoft_lessons/question_screen/circle_timer.dart';

class Clock extends StatefulWidget {
  final int time;

  Clock(this.time);

  @override
  _ClockState createState() => _ClockState();
}

class _ClockState extends State<Clock> with TickerProviderStateMixin {
  AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        vsync: this, duration: Duration(seconds: widget.time));
    controller.value = 0;
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: controller,
        builder: (BuildContext context, Widget child) {
          controller.forward();
          return CustomPaint(painter: CircleTimer(animation: controller));
        });
  }
}
