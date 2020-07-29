import 'package:flutter/material.dart';
import 'package:simbirsoft_lessons/question_screen/answer_box.dart';

class QAnswers extends StatelessWidget {
  final List<String> answers;

  QAnswers(this.answers);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: answers.length,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: AnswerBox(answer: answers[index]),
      ),
    );
  }
}
