import 'dart:math';

import 'package:dio/dio.dart';
import 'package:simbirsoft_lessons/data/model/question.dart';
import 'package:simbirsoft_lessons/data/network/questions.dart';
import 'package:simbirsoft_lessons/data/network/rest_client.dart';
import 'package:simbirsoft_lessons/data/network/result.dart';

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
      int amountAnswers = item.incorrect_answers.length + 1;
      int rightAnswerNum = 1 + Random().nextInt(amountAnswers);
      List<String> answers = List<String>();
      for (int i = 0, bias = 0; i < amountAnswers; i++) {
        if (i == rightAnswerNum - 1) {
          answers.add(item.correct_answer);
          bias++;
        } else {
          answers.add(item.incorrect_answers[i - bias]);
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

  int _getDifficalty(Difficulty difficalty) {
    switch (difficalty) {
      case Difficulty.Easy:
        return 1;
      case Difficulty.Medium:
        return 2;
      case Difficulty.Hard:
        return 3;
    }
    return 0;
  }

  Future<List<Question>> getAllQuestions() async {
    return await Future.wait([_easyQ, _mediumQ, _hardQ]).then((res) {
      allQ = _addToAllQ(res[0])
        ..addAll(_addToAllQ(res[1]))
        ..addAll(_addToAllQ(res[2]));
      return allQ;
    });
  }
}
