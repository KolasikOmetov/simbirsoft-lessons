import 'package:flutter/material.dart';
import 'package:simbirsoft_lessons/bloc/question_bloc.dart';
import 'package:simbirsoft_lessons/bloc/question_logic.dart';
import 'package:simbirsoft_lessons/data/model/question.dart';
import 'package:simbirsoft_lessons/question_screen/clock.dart';
import 'package:simbirsoft_lessons/question_screen/q_answers.dart';
import 'package:simbirsoft_lessons/question_screen/q_number.dart';
import 'package:simbirsoft_lessons/question_screen/q_text.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class QuestionBox extends StatelessWidget {
  final double progressAnimation;
  final Function(double) setProgress;

  QuestionBox(this.progressAnimation, this.setProgress);

  @override
  Widget build(BuildContext context) {
    BaseState state = BlocProvider.of<QuestionBloc>(context).state;
    Question question = state.allQ[state.curQuest];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                QNumber(curQuest: state.curQuest, amount: state.allQ.length),
                Clock(question.difficalty * 10 + 5, progressAnimation,
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
          child: QAnswers(question.answers, state),
          flex: 5,
        )
      ],
    );
  }
}
