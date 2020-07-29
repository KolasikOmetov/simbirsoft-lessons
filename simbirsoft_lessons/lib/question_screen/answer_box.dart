import 'package:flutter/material.dart';

class AnswerBox extends StatefulWidget {
  final String answer;

  AnswerBox({@required this.answer});

  @override
  _AnswerBoxState createState() => _AnswerBoxState();
}

class _AnswerBoxState extends State<AnswerBox> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
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
                style: Theme.of(context).textTheme.bodyText2,
              ),
            ),
            Icon(Icons.blur_circular, color: Colors.white),
          ],
        ),
      ),
    );
  }
}
