import 'package:flutter/material.dart';
import 'package:simbirsoft_lessons/question_screen/clock.dart';
import 'package:simbirsoft_lessons/question_screen/q_answers.dart';
import 'package:simbirsoft_lessons/question_screen/q_number.dart';
import 'package:simbirsoft_lessons/question_screen/q_text.dart';
import 'package:simbirsoft_lessons/model/question.dart';

class QuestionBox extends StatelessWidget {
  final Question question;
  final int curQuest;

  QuestionBox(this.question, this.curQuest);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                QNumber(curQuest),
                Clock(question.difficalty * 10 + 5)
              ],
            ),
          ),
          flex: 1,
        ),
        Expanded(
          child: QText(question.text),
          flex: 2,
        ),
        Expanded(
          child: QAnswers(question.answers),
          flex: 3,
        )
      ],
    );
  }
}
