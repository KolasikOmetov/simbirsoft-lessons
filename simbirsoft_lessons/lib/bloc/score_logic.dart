class ScoreState {
  int curScore;

  ScoreState(this.curScore);
}

class ScoreEvent {}

class ScoreEventIncrement extends ScoreEvent {
  int addition;
  ScoreEventIncrement(this.addition);
}

class ScoreEventGetMax extends ScoreEvent {
  List allQ;
  ScoreEventGetMax(this.allQ);
}
