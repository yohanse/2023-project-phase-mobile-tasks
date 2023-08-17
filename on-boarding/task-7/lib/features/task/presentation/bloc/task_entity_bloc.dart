import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:second/features/task/data/datasource/local_data_source.dart';
import 'package:second/features/task/domain/entities/task_entity.dart';
import 'package:second/features/task/domain/usecases/create_task_usecase.dart';
import 'package:second/features/task/domain/usecases/edit_task_usecase.dart';
import 'package:second/features/task/domain/usecases/get_all_tasks_usecase.dart';
import 'package:second/features/task/domain/usecases/get_single_task_usecase.dart';

import '../../data/repositories/task_repositorie_impl.dart';
import '../../domain/repositories/task_repositories.dart';

part 'task_entity_event.dart';
part 'task_entity_state.dart';

TaskRepository repository = TaskRepositoryImpl(LocalDataSourceImpl());
CreateTAskUsecase createTaskUsecase = CreateTAskUsecase(repository);
GetAllTasksUsecase getAllTasksUsecase = GetAllTasksUsecase(repository);
GetSingleTaskUsecase getSingleTaskUsecase = GetSingleTaskUsecase(repository);
EditTAskUsecase editTaskUseCase = EditTAskUsecase(repository);

class TaskEntityBloc extends Bloc<TaskEntityEvent, TaskEntityState> {
  TaskEntityBloc() : super(TaskEntityInitial()) {
    on<TaskEntityCreateTaskEvent>((event, emit) async {
      emit(LoadingState());
      var result = await createTaskUsecase(taskEntity: event.taskEntity);
      var state =
          result.fold((l) => ErrorState(l.message), (r) => CreateSucessState());
      if (state is ErrorState) {
        emit(state);
      } else {
        emit(LoadingState());
        var result = await getAllTasksUsecase();
        var state = result.fold(
            (l) => ErrorState(l.message), (r) => AllTaskEntitySucessState(r));
        emit(state);
      }
    });

    on<TaskEntityAllTaskEvent>((event, emit) async {
      emit(LoadingState());
      var result = await getAllTasksUsecase();
      var state = result.fold(
          (l) => ErrorState(l.message), (r) => AllTaskEntitySucessState(r));
      emit(state);
    });

    on<TaskEntityEditTaskEvent>((event, emit) async {
      emit(LoadingState());
      var result = await editTaskUseCase(taskEntity: event.taskEntity);
      var state =
          result.fold((l) => ErrorState(l.message), (r) => EditSucessState());
      if (state is ErrorState) {
        emit(state);
      } else {
        emit(LoadingState());
        var result = await getAllTasksUsecase();
        var state = result.fold(
            (l) => ErrorState(l.message), (r) => AllTaskEntitySucessState(r));
        emit(state);
      }

    });
  }
}
