import 'package:flutter/material.dart';
import 'package:simbirsoft_lessons/QuestionScreen/clock.dart';

class QNumber extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text('Question 1/10', style: Theme.of(context).textTheme.headline5),
          Clock(35)
        ],
      ),
    );
  }
}
