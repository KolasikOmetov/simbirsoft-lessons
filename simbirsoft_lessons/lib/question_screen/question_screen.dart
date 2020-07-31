import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:simbirsoft_lessons/network/questions_collection.dart';
import 'package:simbirsoft_lessons/question_screen/question_frame.dart';

class QuestionScreen extends StatefulWidget {
  @override
  _QuestionScreenState createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  }

  final QuestionsCollection collection = QuestionsCollection();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
      builder: (context, projectSnap) {
        if (projectSnap.connectionState == ConnectionState.none &&
            projectSnap.hasData == null) {
          print('project snapshot data is: ${projectSnap.data}');
          return Center(child: Text('Fail to fetch data'));
        }
        if (projectSnap.connectionState == ConnectionState.waiting) {
          return Center(
              child: CircularProgressIndicator(backgroundColor: Colors.yellow));
        }
        return QuestionFrame(collection);
      },
      future: collection.getAllQuestions(),
    ));
  }
}
