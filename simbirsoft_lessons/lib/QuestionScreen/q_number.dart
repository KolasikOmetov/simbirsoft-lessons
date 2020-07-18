import 'package:flutter/material.dart';

class QNumber extends StatelessWidget {
  final int curQuest;

  QNumber(this.curQuest);

  @override
  Widget build(BuildContext context) {
    return Text('Question ' + (curQuest+1).toString() + '/10',
        style: Theme.of(context).textTheme.headline5);
  }
}
