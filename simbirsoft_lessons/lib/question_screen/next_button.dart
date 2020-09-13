import 'package:flutter/material.dart';
import 'package:simbirsoft_lessons/bloc/question_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simbirsoft_lessons/bloc/question_logic.dart';

class NextButton extends StatelessWidget {
  final BaseState state;
  final Function(double) setProgress;
  NextButton(this.state, this.setProgress);

  Widget build(BuildContext context) {
    return GestureDetector(
      child: FractionallySizedBox(
        widthFactor: 0.4,
        heightFactor: 0.4,
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15), color: Colors.pink[400]),
          child: Center(
            child: Text(
              "Next",
              style: Theme.of(context).textTheme.button,
            ),
          ),
        ),
      ),
      onTap: () {
        if (state.chosen == -1) {
          return;
        }
        BlocProvider.of<QuestionBloc>(context)
            .add(CheckQuestionEvent(state, context));
        setProgress(0);
      },
    );
  }
}
