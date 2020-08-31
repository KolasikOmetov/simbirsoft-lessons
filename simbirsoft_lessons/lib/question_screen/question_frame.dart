import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:simbirsoft_lessons/bloc/chosen_bloc.dart';
import 'package:simbirsoft_lessons/bloc/chosen_logic.dart';
import 'package:simbirsoft_lessons/bloc/score_bloc.dart';
import 'package:simbirsoft_lessons/bloc/score_logic.dart';
import 'package:simbirsoft_lessons/data/model/question.dart';
import 'package:simbirsoft_lessons/data/repository/questions_repository.dart';
import 'package:simbirsoft_lessons/score_screen/score_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'next_button.dart';
import 'progress_bar.dart';
import 'question_box.dart';

class QuestionFrame extends StatefulWidget {
  final QuestionsRepository _collection;

  UnmodifiableListView<Question> get allQ =>
      UnmodifiableListView(_collection.allQ);

  QuestionFrame(this._collection);

  @override
  _QuestionFrameState createState() => _QuestionFrameState();
}

class _QuestionFrameState extends State<QuestionFrame> {
  int curQuest = 0;
  double progressAnimation = 0;

  int getMaxScore() {
    int maxScore = 0;
    for (var item in widget._collection.allQ) {
      maxScore += 5 * item.difficalty;
    }
    return maxScore;
  }

  void refresh(BuildContext context) {
    if (curQuest < widget.allQ.length - 1) {
      setProgressTimer(0);
      setState(() {
        curQuest++;
        BlocProvider.of<ChosenBloc>(context).add(ChosenEventChange(-1));
      });
    } else {
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) {
          final state = BlocProvider.of<ScoreBloc>(this.context).state;
          return ScoreScreen(state.curScore, getMaxScore());
        }),
      );
    }
  }

  void checkAnswer(BuildContext context) {
    if (BlocProvider.of<ChosenBloc>(context).state.chosen == -1) {
      return;
    }
    if (BlocProvider.of<ChosenBloc>(context).state.chosen + 1 ==
        widget.allQ[curQuest].rightAnswerNum) {
      BlocProvider.of<ScoreBloc>(context)
          .add(ScoreEventIncrement(widget.allQ[curQuest].difficalty * 5));
    }
    refresh(context);
  }

  void setProgressTimer(double val) {
    progressAnimation = val;
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => ChosenBloc(),
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              children: <Widget>[
                Expanded(
                    child: ProgressBar(
                        BlocProvider.of<ScoreBloc>(context).state.curScore,
                        getMaxScore())),
                Expanded(
                  child: QuestionBox(
                      widget.allQ[curQuest],
                      curQuest,
                      widget.allQ.length,
                      refresh,
                      progressAnimation,
                      setProgressTimer),
                  flex: 6,
                ),
                Expanded(
                  child: NextButton(checkAnswer),
                  flex: 1,
                )
              ],
            )));
  }
}
