import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:second/features/task/domain/entities/task_entity.dart';
import 'package:second/features/task/presentation/bloc/task_entity_bloc.dart';

class TaskWidget extends StatelessWidget {
  final TaskEntity task;
  final int index;
  const TaskWidget({super.key, required this.task, required this.index});

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
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Text(
            task.title[0],
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
              task.title,
              style: const TextStyle(),
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(
              "${task.dueDate.day} / ${task.dueDate.month} / ${task.dueDate.year}",
              textAlign: TextAlign.end,
            ),
          ),
          const SizedBox(
            width: 5,
          ),
          GestureDetector(
            child: const Icon(Icons.delete),
            onTap: () {
              BlocProvider.of<TaskEntityBloc>(context)
                  .add(TaskEntityDeleteTaskEvent(index));
            },
          ),
        ],
      ),
    );
  }
}
