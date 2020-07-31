import 'package:flutter/material.dart';
import 'package:simbirsoft_lessons/network/questions_collection.dart';
import 'next_button.dart';
import 'progress_bar.dart';
import 'question_box.dart';

class QuestionFrame extends StatefulWidget {
  final QuestionsCollection _collection;

  QuestionFrame(this._collection);

  @override
  _QuestionFrameState createState() => _QuestionFrameState();
}

class _QuestionFrameState extends State<QuestionFrame> {

  int curQuest = 0;

  void refresh() {
    setState(() {
      if (curQuest < widget._collection.allQ.length - 1) {
        curQuest++;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              children: <Widget>[
                Expanded(
                  child: ProgressBar(),
                  flex: 1,
                ),
                Expanded(
                  child: QuestionBox(widget._collection.allQ[curQuest], curQuest),
                  flex: 7,
                ),
                Expanded(
                  child: NextButton(refresh),
                  flex: 2,
                )
              ],
            ));
  }
}