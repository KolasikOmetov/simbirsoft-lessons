class Question {
  final String text;
  final List<String> answers;
  final int rightAnswerNum; // 1, 2 or 3
  final int difficalty; // 1, 2 or 3

  Question({this.text, this.answers, this.rightAnswerNum, this.difficalty});
}
