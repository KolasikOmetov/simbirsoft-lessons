import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:simbirsoft_lessons/score_screen/buttons_row.dart';
import 'package:simbirsoft_lessons/score_screen/score_box.dart';

class ScoreScreen extends StatefulWidget {
  final int curScore;
  final int maxScore;

  ScoreScreen(this.curScore, this.maxScore);

  @override
  _ScoreScreenState createState() => _ScoreScreenState();
}

class _ScoreScreenState extends State<ScoreScreen> {
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
          child: Scaffold(
          body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
              child: Column(
                children: <Widget>[
                  Expanded(child: ScoreBox(widget.curScore, widget.maxScore), flex: 3),
                  Expanded(child: ButtonsRow(), flex: 1),
                ],
              ))),
    );
  }
}
