import 'package:flutter/material.dart';
import 'package:simbirsoft_lessons/QuestionScreen/answer_box.dart';

class QAnswers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        AnswerBox(answer: "I dunno"),
        AnswerBox(answer: "It's easy"),
        AnswerBox(answer: "Maybe...")
      ],
    );
  }
}
