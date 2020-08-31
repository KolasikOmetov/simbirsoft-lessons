class ChosenState {
  int chosen;

  ChosenState(this.chosen);
}

class ChosenEvent {}

class ChosenEventChange extends ChosenEvent {
  int number;
  ChosenEventChange(this.number);
}
