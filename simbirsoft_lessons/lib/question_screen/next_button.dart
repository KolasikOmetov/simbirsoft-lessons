import 'package:flutter/material.dart';

class NextButton extends StatefulWidget {
  final Function() notifyParent;

  NextButton(this.notifyParent);

  @override
  _NextButtonState createState() => _NextButtonState();
}

class _NextButtonState extends State<NextButton> {
  @override
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
        widget.notifyParent();
      },
    );
  }
}
