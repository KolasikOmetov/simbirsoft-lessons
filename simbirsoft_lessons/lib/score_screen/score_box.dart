import 'package:flutter/material.dart';

class ScoreBox extends StatelessWidget {
  final int curScore;
  final int maxScore;

  const ScoreBox(this.curScore, this.maxScore);

  @override
  Widget build(BuildContext context) {
    int mark = getMark(curScore, maxScore);
    Color background = setBackground(mark, context);
    String message = setMessage(mark);
    return Container(
      decoration: BoxDecoration(
          color: background,
          borderRadius: BorderRadius.circular(25)),
      child: Center(
        child: Column(
          children: <Widget>[
            Expanded(
                flex: 1,
                child: Center(
                    child: Text("Current Score",
                        style: Theme.of(context).textTheme.headline4))),
            Expanded(
                flex: 2,
                child: Center(
                    child: Text(curScore.toString(),
                        style: Theme.of(context).textTheme.headline1))),
            Expanded(
                flex: 3,
                child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(message,
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.headline4),
                    ))),
          ],
        ),
      ),
    );
  }

  int getMark(int curScore, int maxScore) {
    if (curScore == maxScore) return 5;
    if (curScore > 0.75 * maxScore) return 4;
    if (curScore > 0.5 * maxScore) return 3;
    if (curScore > 0.25 * maxScore)
      return 2;
    else
      return 1;
  }

  Color setBackground(int mark, BuildContext context) {
    switch (mark) {
      case 5:
        return Colors.green[600];
      case 4:
        return Colors.green[800];
      case 3:
        return Theme.of(context).accentColor;
      case 2:
        return Colors.pink[400];
      case 1:
        return Colors.red[600];
    }
    return Colors.red[600];
  }

  String setMessage(int mark) {
    switch (mark) {
      case 5:
        return "So impressive! You're the brightest hotshot! You've got 100%!";
      case 4:
        return "Nicely done! It's your sort of things! You've almost got maximum!";
      case 3:
        return "Pretty good! You know a lot about this theme!";
      case 2:
        return "Not too bad... But you should learn about it little bit more";
      case 1:
        return "Oops! This is a suspiciously low result. You didn't give in?";
    }
    return "It's strange. It seems like error";
  }
}
