import 'dart:math';

import 'package:dio/dio.dart';
import 'package:simbirsoft_lessons/model/question.dart';
import 'package:simbirsoft_lessons/network/questions.dart';
import 'package:simbirsoft_lessons/network/rest_client.dart';

class QuestionsCollection {
  Dio _dio;
  RestClient _restClient;
  List<Question> allQ;
  Future<Questions> _easyQ;
  Future<Questions> _mediumQ;
  Future<Questions> _hardQ;

  QuestionsCollection() {
    _dio = Dio();
    _restClient = RestClient(_dio);
    _getAllQ();
  }

  void _getAllQ() async {
    try {
      _easyQ = _restClient.getEasyQuestions();
      _mediumQ = _restClient.getMediumQuestions();
      _hardQ = _restClient.getHardQuestions();
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
    }
  }

  Future<List<Question>> _addToAllQ(Future<Questions> question) async {
    Questions questions = await question;
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
    allQ = await _addToAllQ(_easyQ)..addAll(await _addToAllQ(_mediumQ))..addAll(await _addToAllQ(_hardQ));
    return allQ;
  }
}
