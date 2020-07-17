import 'package:flutter/material.dart';
import 'package:simbirsoft_lessons/model/question.dart';
import 'next_button.dart';
import 'progress_bar.dart';
import 'question_box.dart';

class QuestionScreen extends StatefulWidget {
  @override
  _QuestionScreenState createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  final List<Question> questions = [
    Question(
        text: 'Какой запрет реже всего нарушают российские граждане?',
        answers: ["Не влезай, убьёт!", "Соблюдайте очередь!", "Не курить!"],
        rightAnswerNum: 1,
        difficalty: 3),
    Question(
        text:
            'Как в народе называют финансовые институты обещающие “золотые горы”?',
        answers: ["Сфинксы", "Пирамиды", "Захронения"],
        rightAnswerNum: 2,
        difficalty: 2),
    Question(
        text: 'Куда на курортных пляжах просят не заплывать отдыхающих?',
        answers: ["За буйки", "За горизонт", "В камыши"],
        rightAnswerNum: 1,
        difficalty: 1),
    Question(
        text: 'При падении чего принято загадывать желание?',
        answers: ["Рубля", "Температуры", "Звезды"],
        rightAnswerNum: 3,
        difficalty: 1),
    Question(
        text:
            'В роли какого автомобильного устройства выступает по отношению к торговле реклама?',
        answers: ["Глушителя", "Двигателя", "Тормоза"],
        rightAnswerNum: 2,
        difficalty: 1),
    Question(
        text: 'Какой рубрики в разделе объявлений не существует?',
        answers: ["Одену", "Сниму", "Продам"],
        rightAnswerNum: 1,
        difficalty: 1),
    Question(
        text:
            'Как благодарные сограждане окрестили период брежневского правления?',
        answers: ["Отстой", "Застой", "Простой"],
        rightAnswerNum: 2,
        difficalty: 2),
    Question(
        text: 'Что показывает судья футболисту, делая предупреждение?',
        answers: ["Средний палец", "Жёлтую карточку", "Паспорт"],
        rightAnswerNum: 2,
        difficalty: 1),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              children: <Widget>[
                Expanded(
                  child: ProgressBar(),
                  flex: 1,
                ),
                Expanded(
                  child: QuestionBox(),
                  flex: 7,
                ),
                Expanded(
                  child: NextButton(),
                  flex: 2,
                )
              ],
            )));
  }
}
