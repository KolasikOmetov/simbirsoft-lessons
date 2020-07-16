import 'package:flutter/material.dart';

class QNumber extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[Text('Question 1/10'), Text('Anim')],
      ),
    );
  }
}
