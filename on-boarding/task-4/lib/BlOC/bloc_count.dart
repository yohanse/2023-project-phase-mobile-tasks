import 'package:bloc/bloc.dart';

import 'event.dart';

class CounterBloc extends Bloc<CounterEvent, int> {

  CounterBloc() : super(0) {
    on<IncreamentEvent>((event, emit) {
      emit((state + 1) % 11);
    });
    on<DecreamentEvent>((event, emit) {
      emit((state + 10) % 11);
    });
  }
}
