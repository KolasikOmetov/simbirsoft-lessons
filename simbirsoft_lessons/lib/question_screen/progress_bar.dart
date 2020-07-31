import 'package:flutter/material.dart';

class ProgressBar extends StatefulWidget {
  final int curScore;
  final int maxScore;

  const ProgressBar(this.curScore, this.maxScore);

  @override
  _ProgressBarState createState() => _ProgressBarState();
}

class _ProgressBarState extends State<ProgressBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: FractionallySizedBox(
          widthFactor: 1,
          heightFactor: 0.4,
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.deepPurple[300]),
            child: FractionallySizedBox(
              alignment: Alignment.centerLeft,
              child: Container(
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Text(
                      "${widget.curScore}",
                      style: Theme.of(context).textTheme.caption,
                    ),
                  ),
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    gradient: LinearGradient(
                        // begin: Alignment.centerLeft,
                        colors: [Colors.pink[400], Colors.red[600]])),
              ),
              heightFactor: 1,
              widthFactor: widget.curScore / widget.maxScore,
            ),
          ),
        ),
      ),
    );
  }
}
