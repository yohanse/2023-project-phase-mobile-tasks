import 'package:second/Data/tasks_data.dart';

abstract class Task {}

class AddTask extends Task {
  final TaskData task;
  AddTask({required this.task});
  
}

class RemoveTask extends Task {}
