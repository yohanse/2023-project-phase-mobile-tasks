import 'dart:async';
import 'package:bloc/bloc.dart';

import 'event.dart';

class CounterBloc extends Bloc<Event, int> {
  CounterBloc() : super(0);

  @override
  Stream<int> mapEventToState(Event event) async* {
    if (event is IncreamentEvent) {
      yield state + 1;
    } else if (event is DecreamentEvent) {
      yield state - 1;
    }
  }
}