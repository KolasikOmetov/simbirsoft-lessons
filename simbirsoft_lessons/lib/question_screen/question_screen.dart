import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:simbirsoft_lessons/bloc/question_bloc.dart';
import 'package:simbirsoft_lessons/bloc/question_logic.dart';
import 'package:simbirsoft_lessons/data/repository/questions_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';
import 'package:simbirsoft_lessons/di/injector_container.dart';
import 'next_button.dart';
import 'progress_bar.dart';
import 'question_box.dart';

class QuestionScreen extends StatefulWidget {

  QuestionScreen();
  @override
  _QuestionScreenState createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  final injector = InjectorContainer().initialise(Injector.getInjector());
  
  double progressAnimation = 0;
  var bloc = QuestionBloc();

  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  }

  void setProgressTimer(double val) {
    progressAnimation = val;
  }

  void dispose(){
    super.dispose();
    bloc.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
                  child: BlocProvider(
              create: (BuildContext context) => bloc,
              child: BlocBuilder<QuestionBloc, QuestionState>(
                cubit: bloc,
                builder: (context, state) {
                  if (state is LoadingState) {
                    bloc
                        .add(LoadingQuestionEvent(QuestionsRepository(injector)));
                    return Center(
                        child: CircularProgressIndicator(
                            backgroundColor: Colors.yellow));
                  } else if (state is ErrorState) {
                    return Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Network error!"),
                        Text(state.exception.toString()),
                        GestureDetector(
                          child: Text(
                            "Try again",
                            style: TextStyle(
                                backgroundColor: Theme.of(context).accentColor),
                          ),
                          onTap: () => bloc
                        .add(ReloadingQuestionEvent()),
                        )
                      ],
                    ));
                  } else if (state is BaseState) {
                    return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        child: Column(
                          children: <Widget>[
                            Expanded(
                                child:
                                    ProgressBar(state.curScore, state.maxScore)),
                            Expanded(
                              child: QuestionBox(progressAnimation, setProgressTimer),
                              flex: 6,
                            ),
                            Expanded(
                              child: NextButton(state, setProgressTimer),
                              flex: 1,
                            )
                          ],
                        ));
                  } else {
                    throw UnimplementedError();
                  }
                },
              )),
        ));
  }
}
