import 'package:bloc/bloc.dart';
import 'package:second/BLOC/event.dart';
import 'package:second/Data/task_manager.dart';

class TaskBloc extends Bloc<Task, TaskManager> {
  TaskBloc() : super(TaskManager()) {
    on<AddTask>((event, emit) {
      state.addTask(event.task);
      emit(state);
    });
    on<UpdateTask>((event, emit) {
      state.updateTask(
          event.index,
          event.title,
          event.date,
          event.description);
      emit(state);
    });
  }
}
