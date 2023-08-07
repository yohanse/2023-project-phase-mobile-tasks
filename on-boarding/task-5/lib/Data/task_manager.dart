import 'package:second/Data/tasks_data.dart';

class TaskManager {
  final List<TaskData> _tasks = [];

  void addTask(TaskData task) {
    _tasks.add(task);
  }

  void deleteTask(int i) {
    _tasks.removeAt(i);
  }

  TaskData singleData(int index) {
    return _tasks[index];
  }

  void updateTask(int index, String title, String date, String description) {
    _tasks[index]
        .update(title: title, description: description, dueDate: date);
  }

  int lengthOfTask() {
    return _tasks.length;
  }
}
