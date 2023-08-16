import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:second/features/task/domain/entities/task_entity.dart';
import 'package:second/features/task/domain/usecases/create_task_usecase.dart';
import 'package:second/features/task/domain/usecases/get_all_tasks_usecase.dart';
import 'package:second/features/task/domain/usecases/get_single_task_usecase.dart';

part 'task_entity_event.dart';
part 'task_entity_state.dart';

class TaskEntityBloc extends Bloc<TaskEntityEvent, TaskEntityState> {
  final CreateTAskUsecase createTaskUsecase;
  final GetAllTasksUsecase getAllTasksUsecase;
  final GetSingleTaskUsecase getSingleTaskUsecase;

  TaskEntityBloc({
    required this.createTaskUsecase,
    required this.getAllTasksUsecase,
    required this.getSingleTaskUsecase,
  }) : super(TaskEntityInitial()) {
    on<TaskEntityCreateTaskEvent>((event, emit) async {
      emit(LoadingState());
      var result = await createTaskUsecase(taskEntity: event.taskEntity);
      var state =
          result.fold((l) => ErrorState(l.message), (r) => CreateSucessState());
      emit(state);
    });

    on<TaskEntitySingleTaskEvent>((event, emit) async {
      emit(LoadingState());
      var result = await getSingleTaskUsecase(id: event.id);
      var state = result.fold(
          (l) => ErrorState(l.message), (r) => SingleTaskEntitySuccesState(r));
      emit(state);
    });

    on<TaskEntityAllTaskEvent>((event, emit) async {
      emit(LoadingState());
      var result = await getAllTasksUsecase();
      var state = result.fold(
          (l) => ErrorState(l.message), (r) => AllTaskEntitySucessState(r));
      emit(state);
    });
  }
}
