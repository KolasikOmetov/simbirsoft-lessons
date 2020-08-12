import 'dart:math';

import 'package:dio/dio.dart';
import 'package:simbirsoft_lessons/data/model/question.dart';
import 'package:simbirsoft_lessons/data/network/questions.dart';
import 'package:simbirsoft_lessons/data/network/rest_client.dart';

class QuestionsRepository {
  Dio _dio;
  RestClient _restClient;
  List<Question> allQ;
  Future<Questions> _easyQ;
  Future<Questions> _mediumQ;
  Future<Questions> _hardQ;

  QuestionsRepository() {
    _dio = Dio();
    _restClient = RestClient(_dio);
    _getAllQ();
  }

  void _getAllQ() async {
      _easyQ = _restClient.getEasyQuestions();
      _mediumQ = _restClient.getMediumQuestions();
      _hardQ = _restClient.getHardQuestions();
  }

  List<Question> _addToAllQ(Questions questions) {
    List<Question> allQ = List<Question>();
    for (var item in questions.results) {
      int amountAnswers = item.incorrectAnswers.length + 1;
      int rightAnswerNum = 1 + Random().nextInt(amountAnswers);
      List<String> answers = List<String>();
      for (int i = 0, bias = 0; i < amountAnswers; i++) {
        if (i == rightAnswerNum - 1) {
          answers.add(item.correctAnswer);
          bias++;
        } else {
          answers.add(item.incorrectAnswers[i - bias]);
        }
      }
      allQ.add(Question(
          text: item.question,
          answers: answers,
          difficalty: _getDifficalty(item.difficulty),
          rightAnswerNum: rightAnswerNum));
    }
    print('Length: ${allQ.length}');
    return allQ;
  }

  int _getDifficalty(String difficalty) {
    switch (difficalty) {
      case 'easy':
        return 1;
      case 'medium':
        return 2;
      case 'hard':
        return 3;
    }
    return 0;
  }

  Future<List<Question>> getAllQuestions() async {
    return Future.wait([_easyQ, _mediumQ, _hardQ]).then((res) =>
        _addToAllQ(res[0])
          ..addAll(_addToAllQ(res[1]))
          ..addAll(_addToAllQ(res[2])));
  }
}