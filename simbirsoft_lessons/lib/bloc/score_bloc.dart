import 'package:bloc/bloc.dart';
import 'package:simbirsoft_lessons/bloc/score_logic.dart';

class ScoreBloc extends Bloc<ScoreEvent, ScoreState> {
  ScoreBloc() : super(ScoreState(0));

  @override
  Stream<ScoreState> mapEventToState(ScoreEvent event) async* {
    if (event is ScoreEventIncrement) {
      yield ScoreState(state.curScore + event.addition);
    } else {
      throw UnimplementedError();
    }
  }
}
