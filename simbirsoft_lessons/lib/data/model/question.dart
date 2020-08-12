class Question {
  final String text;
  final List<String> answers;
  final int rightAnswerNum; // from 1 to answers.length
  final int difficalty; // 1, 2 or 3

  Question({this.text, this.answers, this.rightAnswerNum, this.difficalty});
}
