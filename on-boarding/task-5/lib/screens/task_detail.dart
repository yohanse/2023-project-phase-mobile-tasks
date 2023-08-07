import 'package:flutter/material.dart';
import 'package:second/Data/tasks_data.dart';
import '../widget/custom_col_widget.dart';

class TaskDetailView extends StatelessWidget {
  final TaskData task;
  const TaskDetailView({super.key, required this.task});

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
    );
  }
}