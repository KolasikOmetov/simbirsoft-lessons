import 'package:flutter/material.dart';

class QText extends StatelessWidget {
  final String text;

  QText(this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Text(text, style: Theme.of(context).textTheme.headline6));
  }
}
