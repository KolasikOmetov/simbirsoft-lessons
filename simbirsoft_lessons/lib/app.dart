import 'package:flutter/material.dart';

import 'QuestionScreen/question_screen.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Qiuz',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.deepPurple,
          scaffoldBackgroundColor: Colors.deepPurple[800],
          visualDensity: VisualDensity.adaptivePlatformDensity,
          textTheme: TextTheme(caption: TextStyle(fontSize: 10))),
      home: SafeArea(child: QuestionScreen()),
    );
  }
}
