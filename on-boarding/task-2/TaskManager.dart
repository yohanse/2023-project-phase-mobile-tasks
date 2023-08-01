import 'Tasks.dart';

class TaskManager {
  List<Task> tasks = [];

  void addTask(
    String title,
    String description,
    DateTime dueDate,
    bool status,
  ) {
    tasks.add(Task(title, description, dueDate, status));
  }

  void viewAllTasks() {
    for (int i = 0; i < tasks.length; i++) {
      print("${i + 1}.  ${tasks[i]}");
    }
  }

  void viewcompletedTasks() {
    for (int i = 0; i < tasks.length; i++) {
      if (!tasks[i].getSatus()) {
        print("${i + 1}.  ${tasks[i]}");
      }
    }
  }

  void viewpendingTasks() {
    for (int i = 0; i < tasks.length; i++) {
      if (tasks[i].getSatus()) {
        print("${i + 1}.  ${tasks[i]}");
      }
    }
  }

  void editTask(
      {i,
      title = "noUpdate",
      description = "noUpdate",
      dueDate = "noUpdate",
      status = "noUpdate"}) {
    if (title != "noUpdate") {
      tasks[i - 1].setTitle(title);
    }

    if (description != "noUpdate") {
      tasks[i - 1].setDescription(description);

      if (dueDate != "noUpdate") {
        tasks[i - 1].setDueDate(dueDate);
      }

      if (status != "noUpdate") {
        tasks[i - 1].setStatus(status);
      }
    }
  }

  void deleteTask(int i) {
    tasks.removeAt(i - 1);
  }
}

void main() {
  TaskManager taskManager = TaskManager();

  taskManager.addTask(
      "programming1", "description", DateTime(2023, 1, 12), false);
  taskManager.addTask(
      "programming2", "description", DateTime(2023, 1, 12), true);
  taskManager.addTask(
      "programming3", "description", DateTime(2023, 1, 12), true);
  taskManager.addTask(
      "programming4", "description", DateTime(2023, 1, 12), false);
  taskManager.addTask(
      "programming5", "description", DateTime(2023, 1, 12), true);
  taskManager.addTask(
      "programming6", "description", DateTime(2023, 1, 12), false);
  taskManager.addTask(
      "programming7", "description", DateTime(2023, 1, 12), true);

  taskManager.viewAllTasks();
  print("");
  taskManager.viewcompletedTasks();
  print("");
  taskManager.viewpendingTasks();
  print("");
  print("");
  print("");
  taskManager.deleteTask(2);
  taskManager.editTask(i: 2, title: "mobile");
  taskManager.editTask(i: 3, description: "back end");

  taskManager.viewAllTasks();
  print("");
  taskManager.viewcompletedTasks();
  print("");
  taskManager.viewpendingTasks();
}