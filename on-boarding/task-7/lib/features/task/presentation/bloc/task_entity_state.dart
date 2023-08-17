part of 'task_entity_bloc.dart';

@immutable
sealed class TaskEntityState {}

final class TaskEntityInitial extends TaskEntityState {}


class LoadingState implements TaskEntityState {}

class AllTaskEntitySucessState implements TaskEntityState {
  final List<TaskEntity> listOfTaskEntity;

  AllTaskEntitySucessState(this.listOfTaskEntity);
}

class ErrorState implements TaskEntityState {
  final String message;

  ErrorState(this.message);
}

class CreateSucessState {}

class EditSucessState {}

class DeleteSucessState {}

class SortSucessState {}
