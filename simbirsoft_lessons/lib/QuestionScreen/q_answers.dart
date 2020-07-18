import 'package:flutter/material.dart';
import 'package:simbirsoft_lessons/QuestionScreen/answer_box.dart';

class QAnswers extends StatelessWidget {
  final List<String> answers;

  QAnswers(this.answers);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        AnswerBox(answer: answers[0]),
        AnswerBox(answer: answers[1]),
        AnswerBox(answer: answers[2])
      ],
    );
  }
}
