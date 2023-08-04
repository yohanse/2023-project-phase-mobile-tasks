import 'package:flutter/material.dart';
import '../Data/all_tasks_data.dart';
import '../widget/custom_col_widget.dart';

class TaskDetailView extends StatelessWidget {
  final int index;
  const TaskDetailView({super.key, required this.index});

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
              text: data[index][0],
            ),
            const SizedBox(height: 20),
            CustomColumn(
              height: 100,
              title: "Description",
              text: data[index][2],
            ),
            const SizedBox(height: 20),
            CustomColumn(
              height: 40,
              title: "Deadline",
              text: "${data[index][1].day}/${data[index][1].month}/${data[index][1].year}"
            ),
          ],
        ),
      ),
    );
  }
}