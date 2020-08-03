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
  int numChosen = -1;
  double progressAnimation = 0;

  int getMaxScore() {
    int maxScore = 0;
    for (var item in widget._collection.allQ) {
      maxScore += 5 * item.difficalty;
    }
    return maxScore;
  }

  void refresh() {
    if (curQuest < widget._collection.allQ.length - 1) {
      setProgressTimer(0);
      setState(() {
        curQuest++;
        numChosen = -1;
      });
    } else {
      // go to the score screen
    }
  }

  void setGlobalChosen(int number) {
    if (number != numChosen) {
      setState(() {
        numChosen = number;
      });
    }
  }

  void checkAnswer() {
    if (numChosen == -1) {
      return;
    }
    if (numChosen + 1 == widget._collection.allQ[curQuest].rightAnswerNum) {
      curScore += widget._collection.allQ[curQuest].difficalty * 5;
    }
    refresh();
  }

  void setProgressTimer(double val) {
    progressAnimation = val;
  }

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
              child: QuestionBox(
                  widget._collection.allQ[curQuest],
                  curQuest,
                  widget._collection.allQ.length,
                  setGlobalChosen,
                  numChosen,
                  refresh,
                  progressAnimation,
                  setProgressTimer),
              flex: 8,
            ),
            Expanded(
              child: NextButton(checkAnswer),
              flex: 2,
            )
          ],
        ));
  }
}
