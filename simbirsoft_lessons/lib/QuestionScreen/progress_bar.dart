import 'package:flutter/material.dart';

class ProgressBar extends StatefulWidget {
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
            child: FittedBox(
              alignment: Alignment.centerLeft,
              child: Container(
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Text(
                      "30",
                      style: Theme.of(context).textTheme.caption,
                    ),
                  ),
                ),
                height: 20,
                width: 70,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    gradient: LinearGradient(
                        // begin: Alignment.centerLeft,
                        colors: [Colors.pink[400], Colors.red[600]])),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
