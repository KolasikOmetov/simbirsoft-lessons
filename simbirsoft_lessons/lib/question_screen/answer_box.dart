import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simbirsoft_lessons/bloc/question_bloc.dart';
import 'package:simbirsoft_lessons/bloc/question_logic.dart';

class AnswerBox extends StatefulWidget {
  final String answer;
  final int number;

  AnswerBox({@required this.answer, this.number});

  @override
  _AnswerBoxState createState() => _AnswerBoxState();
}

class _AnswerBoxState extends State<AnswerBox> {
  @override
  Widget build(BuildContext context) {
    BaseState state = BlocProvider.of<QuestionBloc>(context).state;
    bool isChosen = widget.number == state.chosen;
    return GestureDetector(
      onTap: () {
        if (!isChosen) {
          BlocProvider.of<QuestionBloc>(context)
              .add(ChooseQuestionEvent(state, widget.number));
        }
      },
      child: Container(
        decoration: BoxDecoration(
            color: isChosen ? Colors.white : Colors.transparent,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.deepPurple[300], width: 3)),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                child: Text(
                  widget.answer,
                  style: isChosen
                      ? Theme.of(context).textTheme.bodyText1
                      : Theme.of(context).textTheme.bodyText2,
                ),
              ),
              Icon(isChosen ? Icons.check_circle : Icons.blur_circular,
                  color: isChosen ? Colors.deepPurple[300] : Colors.white),
            ],
          ),
        ),
      ),
    );
  }
}
