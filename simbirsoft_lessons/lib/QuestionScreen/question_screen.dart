import 'package:flutter/material.dart';
import 'next_button.dart';
import 'progress_bar.dart';
import 'question_box.dart';

class QuestionScreen extends StatefulWidget {
  @override
  _QuestionScreenState createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: <Widget>[
        Expanded(
          child: ProgressBar(),
          flex: 1,
        ),
        Expanded(
          child: QuestionBox(),
          // child: Container(
          //   color: Colors.blue,
          // ),
          flex: 8,
        ),
        Expanded(
          child: NextButton(),
          flex: 1,
        )
      ],
    ));
  }
}
