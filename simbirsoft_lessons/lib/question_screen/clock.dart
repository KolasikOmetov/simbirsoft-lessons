import 'package:flutter/material.dart';
import 'package:simbirsoft_lessons/bloc/question_bloc.dart';
import 'package:simbirsoft_lessons/bloc/question_logic.dart';
import 'package:simbirsoft_lessons/question_screen/circle_timer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Clock extends StatefulWidget {
  final int time;
  final Function(double) setProgress;
  final double progressAnimation;

  Clock(this.time, this.progressAnimation, this.setProgress);

  @override
  _ClockState createState() => _ClockState();
}

class _ClockState extends State<Clock> with TickerProviderStateMixin {
  AnimationController controller;

  _ClockState();

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        vsync: this, duration: Duration(seconds: widget.time));
    controller.value = 0;
  }

  @override
  Widget build(BuildContext context) {
    controller.value = widget.progressAnimation;
    return AnimatedBuilder(
        animation: controller,
        builder: (BuildContext context, Widget child) {
          TickerFuture progress = controller.forward();
          widget.setProgress(controller.value);
          progress.whenComplete(() {
            BlocProvider.of<QuestionBloc>(context)
                .add(RefreshQuestionEvent(context, BlocProvider.of<QuestionBloc>(context).state));
            widget.setProgress(0);
          });
          return CustomPaint(painter: CircleTimer(animation: controller));
        });
  }
}
