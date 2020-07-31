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
  int curScore = 0;

  int getMaxScore() {
    int maxScore = 0;
    for (var item in widget._collection.allQ) {
      maxScore += 5 * item.difficalty;
    }
    return maxScore;
  }

  void refresh() {
    setState(() {
      if (curQuest < widget._collection.allQ.length - 1) {
        curQuest++;
      }
    });
  }

  void checkAnswer() {}

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          children: <Widget>[
            Expanded(
              child: ProgressBar(curScore, getMaxScore()),
              flex: 1,
            ),
            Expanded(
              child: QuestionBox(widget._collection.allQ[curQuest], curQuest,
                  widget._collection.allQ.length),
              flex: 8,
            ),
            Expanded(
              child: NextButton(refresh, checkAnswer),
              flex: 2,
            )
          ],
        ));
  }
}
