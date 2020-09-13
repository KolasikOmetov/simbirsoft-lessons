import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:simbirsoft_lessons/data/model/question.dart';
import 'package:simbirsoft_lessons/data/repository/questions_repository.dart';

class QuestionState {}

class LoadingState extends QuestionState {}

class ErrorState extends QuestionState {
  Exception exception;

  ErrorState(this.exception);
}

class BaseState extends QuestionState {
  final UnmodifiableListView<Question> allQ;
  int curQuest;
  int chosen;
  int curScore;
  int get maxScore => getMaxScore();

  BaseState(this.curQuest, this.chosen, this.curScore, {@required this.allQ});

  int getMaxScore() {
    int maxScore = 0;
    for (var item in allQ) {
      maxScore += 5 * item.difficalty;
    }
    return maxScore;
  }
}

class QuestionEvent {}

class LoadingQuestionEvent extends QuestionEvent {
  QuestionsRepository repository;

  LoadingQuestionEvent(this.repository);
}

class ReloadingQuestionEvent extends QuestionEvent {}

class RefreshQuestionEvent extends QuestionEvent {
  BaseState state;
  final BuildContext context;

  RefreshQuestionEvent(this.context, this.state);
}

class CheckQuestionEvent extends QuestionEvent {
  BuildContext context;
  BaseState state;

  CheckQuestionEvent(this.state, this.context);
}

class ChooseQuestionEvent extends QuestionEvent {
  BaseState state;
  final int chosen;

  ChooseQuestionEvent(this.state, this.chosen);
}
