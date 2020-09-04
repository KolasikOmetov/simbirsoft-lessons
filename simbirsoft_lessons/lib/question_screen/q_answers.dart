import 'package:flutter/material.dart';
import 'package:simbirsoft_lessons/bloc/question_logic.dart';
import 'package:simbirsoft_lessons/question_screen/answer_box.dart';

class QAnswers extends StatefulWidget {
  final List<String> answers;
  final BaseState state;

  QAnswers(this.answers, this.state);

  @override
  _QAnswersState createState() => _QAnswersState();
}

class _QAnswersState extends State<QAnswers> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: widget.answers.length,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: AnswerBox(answer: widget.answers[index], number: index),
      ),
    );
  }
}
