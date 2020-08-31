import 'package:bloc/bloc.dart';
import 'package:simbirsoft_lessons/bloc/chosen_logic.dart';

class ChosenBloc extends Bloc<ChosenEvent, ChosenState> {
  ChosenBloc() : super(ChosenState(-1));

  @override
  Stream<ChosenState> mapEventToState(ChosenEvent event) async* {
    if (event is ChosenEventChange) {
      yield ChosenState(event.number);
    } else {
      throw UnimplementedError();
    }
  }
}
