import 'package:flutter/material.dart';

import 'question_screen/question_screen.dart';

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
        textTheme: TextTheme(
          caption: TextStyle(fontSize: 7, color: Colors.white),
          headline5: TextStyle(color: Colors.yellow, fontSize: 25),
          headline6: TextStyle(color: Colors.white, fontSize: 20),
          bodyText1: TextStyle(fontSize: 17, color: Colors.deepPurple[300]),
          bodyText2: TextStyle(fontSize: 17, color: Colors.white),
          button: TextStyle(fontSize: 17, color: Colors.white),
        ),
      ),
      home: SafeArea(child: QuestionScreen()),
    );
  }
}
