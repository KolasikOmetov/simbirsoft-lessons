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
        body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              children: <Widget>[
                Expanded(
                  child: ProgressBar(),
                  flex: 1,
                ),
                Expanded(
                  child: QuestionBox(),
                  flex: 7,
                ),
                Expanded(
                  child: NextButton(),
                  flex: 2,
                )
              ],
            )));
  }
}
