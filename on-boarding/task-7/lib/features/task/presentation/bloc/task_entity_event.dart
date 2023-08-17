part of 'task_entity_bloc.dart';

@immutable
sealed class TaskEntityEvent {}

class TaskEntityCreateTaskEvent implements TaskEntityEvent {
  final TaskEntity taskEntity;

  TaskEntityCreateTaskEvent(this.taskEntity);
}

class TaskEntitySingleTaskEvent implements TaskEntityEvent {
  final int id;

  TaskEntitySingleTaskEvent(this.id);
  
}

class TaskEntityAllTaskEvent implements TaskEntityEvent {}

class TaskEntityEditTaskEvent implements TaskEntityEvent{
    final TaskEntity taskEntity;

    TaskEntityEditTaskEvent(this.taskEntity);
}
