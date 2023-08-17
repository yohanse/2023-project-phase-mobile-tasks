import 'package:flutter/material.dart';
import 'package:second/features/task/domain/entities/task_entity.dart';
import 'package:second/features/task/presentation/pages/edit_task_page.dart';
import '../widget/custom_col_widget.dart';

class TaskDetailView extends StatelessWidget {
  final TaskEntity task;
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
              text: task.title,
            ),
            const SizedBox(height: 20),
            CustomColumn(
              height: 100,
              title: "Description",
              text: task.description,
            ),
            const SizedBox(height: 20),
            CustomColumn(
              height: 40,
              title: "Deadline",
              text: '${task.dueDate.day} / ${task.dueDate.month} / ${task.dueDate.year}',
            ),

            const SizedBox(height: 20),

            Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 120,
                ),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EditTaskPage(taskEntity: task),
                  ),
                );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFEE6F57),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: const Text(
                    "Edit task",
                  ),
                ),
              ),
            
          ],
        ),
      ),
    );
  }
}
