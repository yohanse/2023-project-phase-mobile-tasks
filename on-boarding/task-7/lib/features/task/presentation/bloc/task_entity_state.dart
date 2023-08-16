part of 'task_entity_bloc.dart';

@immutable
sealed class TaskEntityState {}

final class TaskEntityInitial extends TaskEntityState {}


class LoadingState implements TaskEntityState {}



class SingleTaskEntitySuccesState implements TaskEntityState {
  final TaskEntity taskEntity;

  SingleTaskEntitySuccesState(this.taskEntity);
}



class AllTaskEntitySucessState implements TaskEntityState {
  final List<TaskEntity> listOfTaskEntity;

  AllTaskEntitySucessState(this.listOfTaskEntity);
}



class ErrorState implements TaskEntityState {
  final String message;

  ErrorState(this.message);
}



class CreateSucessState implements TaskEntityState {}
