import 'package:flutter/material.dart';

class NextButton extends StatelessWidget {
  final Function() checkAnswer;

  NextButton(this.checkAnswer);

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
        checkAnswer();
      },
    );
  }
}
