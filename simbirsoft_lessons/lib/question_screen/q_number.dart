import 'package:flutter/material.dart';

class QNumber extends StatelessWidget {
  final int curQuest;
  final int amount;

  QNumber({this.curQuest, this.amount});

  @override
  Widget build(BuildContext context) {
    return Text('Question ${curQuest+1}/$amount',
        style: Theme.of(context).textTheme.headline5);
  }
}
