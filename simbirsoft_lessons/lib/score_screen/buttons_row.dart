import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:simbirsoft_lessons/question_screen/question_screen.dart';

class ButtonsRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        buttonIcon(
          context,
          iColor: Colors.white,
          iData: Icons.arrow_back,
          color: Colors.red[600],
        ),
        buttonIcon(context,
            iColor: Colors.white,
            iData: Icons.refresh,
            color: Colors.pink[400], fun: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => QuestionScreen()),
          );
        })
      ],
    );
  }

  Widget buttonIcon(BuildContext context,
      {Function fun,
      IconData iData = Icons.add_circle,
      Color color = Colors.transparent,
      Color iColor = Colors.black,
      double radius = 20}) {
    return GestureDetector(
        child: Container(
            decoration: BoxDecoration(
                color: color, borderRadius: BorderRadius.circular(radius)),
            child: Icon(
              iData,
              color: iColor,
              size: 80,
            )),
        onTap: fun);
  }
}
