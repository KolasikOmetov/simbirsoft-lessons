import 'package:flutter/material.dart';
import 'package:simbirsoft_lessons/data/model/question.dart';
import 'package:simbirsoft_lessons/question_screen/clock.dart';
import 'package:simbirsoft_lessons/question_screen/q_answers.dart';
import 'package:simbirsoft_lessons/question_screen/q_number.dart';
import 'package:simbirsoft_lessons/question_screen/q_text.dart';

class QuestionBox extends StatelessWidget {
  final Question question;
  final int curQuest;
  final int amount;
  final int numChosen;
  final Function(int) setGlobalChosen;
  final Function refresh;
  final double progressAnimation;
  final Function(double) setProgress;

  QuestionBox(this.question, this.curQuest, this.amount, this.setGlobalChosen,
      this.numChosen, this.refresh, this.progressAnimation, this.setProgress);

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
                QNumber(curQuest: curQuest, amount: amount),
                Clock(question.difficalty * 10 + 5, refresh, progressAnimation,
                    setProgress)
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
          child: QAnswers(question.answers, setGlobalChosen, numChosen),
          flex: 5,
        )
      ],
    );
  }
}
