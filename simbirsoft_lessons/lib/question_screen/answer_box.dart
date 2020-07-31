import 'package:flutter/material.dart';

class AnswerBox extends StatefulWidget {
  final String answer;
  final int number;
  final int numChosen;
  final Function(int) setChosen;

  AnswerBox(
      {@required this.answer, this.number, this.setChosen, this.numChosen});

  @override
  _AnswerBoxState createState() => _AnswerBoxState();
}

class _AnswerBoxState extends State<AnswerBox> {
  @override
  Widget build(BuildContext context) {
    bool isChosen = widget.number == widget.numChosen;
    return GestureDetector(
      onTap: () {
        widget.setChosen(widget.number);
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
                  style: isChosen ? Theme.of(context).textTheme.bodyText1 : Theme.of(context).textTheme.bodyText2,
                ),
              ),
              Icon(isChosen ? Icons.check_circle : Icons.blur_circular, color: isChosen ? Colors.deepPurple[300] : Colors.white),
            ],
          ),
        ),
      ),
    );
  }
}
