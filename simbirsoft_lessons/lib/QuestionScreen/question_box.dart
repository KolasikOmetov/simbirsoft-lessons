import 'package:flutter/material.dart';
import 'package:simbirsoft_lessons/QuestionScreen/q_answers.dart';
import 'package:simbirsoft_lessons/QuestionScreen/q_number.dart';
import 'package:simbirsoft_lessons/QuestionScreen/q_text.dart';

class QuestionBox extends StatefulWidget {
  @override
  _QuestionBoxState createState() => _QuestionBoxState();
}

class _QuestionBoxState extends State<QuestionBox> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: QNumber(),
            flex: 1,
          ),
          Expanded(
            child: QText(),
            // child: Container(
            //   color: Colors.blue,
            // ),
            flex: 3,
          ),
          Expanded(
            child: QAnswers(),
            flex: 3,
          )
        ],
      ),
    );
  }
}
