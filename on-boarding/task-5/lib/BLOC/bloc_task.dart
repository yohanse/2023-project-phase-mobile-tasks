import 'package:bloc/bloc.dart';
import 'package:second/BLOC/event.dart';

class TaskBloc extends Bloc<Task, List<List<String>>> {

  TaskBloc() : super([["UI/UX Design", "07/08/2023", "I will develop my self for comming project"],]) {
    on<AddTask>((event, emit) {
      emit((state + 1) % 11);
    });
    
  }
}