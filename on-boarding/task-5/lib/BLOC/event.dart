import 'package:second/Data/tasks_data.dart';

abstract class Task {}

class AddTask extends Task {
  final TaskData task;
  AddTask({required this.task});
}

class UpdateTask extends Task {
  final int index;
  final String title, date, description;
  UpdateTask({required this.index, required this.title, required this.date, required this.description});
}

class RemoveTask extends Task {}
