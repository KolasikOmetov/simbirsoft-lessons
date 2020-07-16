import 'package:flutter/material.dart';
import 'package:simbirsoft_lessons/QuestionScreen/q_answers.dart';
import 'package:simbirsoft_lessons/QuestionScreen/q_number.dart';
import 'package:simbirsoft_lessons/QuestionScreen/q_text.dart';

class QuestionBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          child: QNumber(),
          flex: 1,
        ),
        Expanded(
          child: QText(),
          flex: 3,
        ),
        Expanded(
          child: QAnswers(),
          flex: 3,
        )
      ],
    );
  }
}
