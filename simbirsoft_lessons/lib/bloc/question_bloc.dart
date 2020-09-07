import 'dart:collection';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:simbirsoft_lessons/bloc/question_logic.dart';
import 'package:simbirsoft_lessons/score_screen/score_screen.dart';

class QuestionBloc extends Bloc<QuestionEvent, QuestionState> {
  QuestionBloc() : super(LoadingState());

  @override
  Stream<QuestionState> mapEventToState(QuestionEvent event) async* {
    // LoadingQuestionEvent
    if (event is LoadingQuestionEvent) {
      try {
        await event.repository.getAllQuestions();
      } catch (e) {
        yield ErrorState(e);
        return;
      }
      yield BaseState(0, -1, 0,
          allQ: UnmodifiableListView(event.repository.allQ));
    } else
    // ReloadingQuestionEvent
    if (event is ReloadingQuestionEvent) {
      yield LoadingState();
    } else
    // RefreshQuestionEvent
    if (event is RefreshQuestionEvent) {
      BaseState state = event.state;
      if (state.curQuest < state.allQ.length - 1) {
        yield BaseState(state.curQuest + 1, -1, state.curScore,
            allQ: state.allQ);
      } else {
        Navigator.of(event.context).push(
          MaterialPageRoute(
              builder: (context) =>
                  ScoreScreen(state.curScore, state.maxScore)),
        );
      }
    } else
    // CheckQuestionEvent
    if (event is CheckQuestionEvent) {
      var state = event.state;
      if (state.chosen + 1 == state.allQ[state.curQuest].rightAnswerNum) {
        state.curScore = state.curScore + state.allQ[state.curQuest].difficalty * 5;
      }
      if (state.curQuest < state.allQ.length - 1) {
        yield BaseState(state.curQuest + 1, -1, state.curScore,
            allQ: state.allQ);
      } else {
        Navigator.of(event.context).push(
          MaterialPageRoute(
              builder: (context) =>
                  ScoreScreen(state.curScore, state.maxScore)),
        );
      }
    } else
    // ChooseQuestionEvent
    if (event is ChooseQuestionEvent) {
      var state = event.state;
      print("ChooseQuestionEvent");
      yield BaseState(state.curQuest, event.chosen, state.curScore,
          allQ: state.allQ);
    } else {
      throw UnimplementedError();
    }
  }
}
