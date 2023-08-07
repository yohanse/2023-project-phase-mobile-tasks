import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:second/BLOC/bloc_task.dart';
import 'package:second/Data/task_manager.dart';
import 'package:second/screens/task_add_page.dart';
import 'package:second/screens/task_detail.dart';

import '../widget/widget_task.dart';

class TaskList extends StatefulWidget {
  const TaskList({super.key});

  @override
  State<TaskList> createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            "Todo List",
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Tasks list",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            Expanded(
              child: BlocBuilder<TaskBloc, TaskManager>(
                builder: (context, state) {
                  return ListView.builder(
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        child: TaskWidget(
                          task: state.singleData(index),
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  TaskDetailView(task: state.singleData(index), index: index,),
                            ),
                          );
                        },
                      );
                    },
                    itemCount: state.lengthOfTask(),
                  );
                },
              ),
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
                    builder: (context) => CreatTask(),
                  ),
                );
              },
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                    Radius.circular(8.0)), // Customize the corner radius here
              ),
              backgroundColor: const Color(0xFFEE6F57),
              child: const Text("Creat task"),
            ),
          ),
        ],
      ),
    );
  }
}

