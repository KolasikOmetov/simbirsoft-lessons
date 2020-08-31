import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simbirsoft_lessons/bloc/chosen_bloc.dart';
import 'package:simbirsoft_lessons/bloc/chosen_logic.dart';

class AnswerBox extends StatefulWidget {
  final String answer;
  final int number;
  final Function refreshAnswers;

  AnswerBox({@required this.answer, this.number, this.refreshAnswers});

  @override
  _AnswerBoxState createState() => _AnswerBoxState();
}

class _AnswerBoxState extends State<AnswerBox> {
  @override
  Widget build(BuildContext context) {
    bool isChosen =
        widget.number == BlocProvider.of<ChosenBloc>(context).state.chosen;
    return GestureDetector(
      onTap: () {
        if (!isChosen) {
          BlocProvider.of<ChosenBloc>(context)
              .add(ChosenEventChange(widget.number));
          widget.refreshAnswers();
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
