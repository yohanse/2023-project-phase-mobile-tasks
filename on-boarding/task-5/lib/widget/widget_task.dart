import 'package:flutter/material.dart';
import 'package:second/Data/tasks_data.dart';


class TaskWidget extends StatelessWidget {
  final TaskData task;
  const TaskWidget({
    super.key,
    required this.task
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
            color: Colors.grey, // Set the border color to gray
            width: 2.0, // Set the border width
          ),
        borderRadius: const BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.symmetric(vertical:10),
      child: Row(
        children: [
          Text(
            task.firstLetter(),
            style: const TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(
            width: 8,
          ),
          Expanded(
            flex: 2,
            child: Text(
              task.getTitle(),
              style: const TextStyle(
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(
              task.getDate(),
              textAlign: TextAlign.end,
            ),
          )
        ],
      ),
    );
  }
}
