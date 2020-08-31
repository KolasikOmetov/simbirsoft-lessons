import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/services.dart';
import 'package:simbirsoft_lessons/data/repository/questions_repository.dart';
import 'package:simbirsoft_lessons/question_screen/question_frame.dart';
import 'package:simbirsoft_lessons/bloc/score_bloc.dart';

class QuestionScreen extends StatefulWidget {
  @override
  _QuestionScreenState createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  }

  final QuestionsRepository repository = QuestionsRepository();
  final _scoreBloc = ScoreBloc();

  @override
  void dispose() {
    _scoreBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
      builder: (context, projectSnap) {
        if (projectSnap.connectionState == ConnectionState.none &&
            projectSnap.hasData == null) {
          print('project snapshot data is: ${projectSnap.data}');
          return Center(child: Text('Fail to fetch data((('));
        }
        if (projectSnap.hasError) {
          print('${projectSnap.error}');
          return Center(child: Text("Network error!"));
        }
        if (projectSnap.connectionState == ConnectionState.waiting) {
          return Center(
              child: CircularProgressIndicator(backgroundColor: Colors.yellow));
        }
        return BlocProvider(
          create: (BuildContext context) => _scoreBloc,
          child: QuestionFrame(repository),
        );
      },
      future: repository.getAllQuestions(),
    ));
  }
}
