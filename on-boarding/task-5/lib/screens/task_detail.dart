import 'package:flutter/material.dart';
import 'package:second/Data/tasks_data.dart';
import 'package:second/screens/task_update_create_page.dart';
import '../widget/custom_col_widget.dart';

class TaskDetailView extends StatelessWidget {
  final TaskData task;
  final int index;
  const TaskDetailView({super.key, required this.task, required this.index});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            "Task detail",
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: Container(
        padding: const EdgeInsets.all(40),
        child: ListView(
          children: [
            CustomColumn(
              height: 40,
              title: "Title",
              text: task.getTitle(),
            ),
            const SizedBox(height: 20),
            CustomColumn(
              height: 100,
              title: "Description",
              text: task.getDescription(),
            ),
            const SizedBox(height: 20),
            CustomColumn(
              height: 40,
              title: "Deadline",
              text: task.getDate(),
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            height: 50,
            width: 150,
            child: FloatingActionButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CreatOrUpdateTask(
                      buttonName: "Update Task",
                      defaultDate: task.getDate(),
                      defaultDescription: task.getDescription(),
                      defaultName: task.getTitle(),
                    ),
                  ),
                );
              },
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                    Radius.circular(8.0)), // Customize the corner radius here
              ),
              backgroundColor: const Color(0xFFEE6F57),
              child: const Text("Update task"),
            ),
          ),
          SizedBox(
            height: 50,
            width: 150,
            child: FloatingActionButton(
              onPressed: () {
                Navigator.pop(context);
              },
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                    Radius.circular(8.0)), // Customize the corner radius here
              ),
              backgroundColor: const Color(0xFFEE6F57),
              child: const Text("Remove task"),
            ),
          )
        ],
      ),
    );
  }
}
