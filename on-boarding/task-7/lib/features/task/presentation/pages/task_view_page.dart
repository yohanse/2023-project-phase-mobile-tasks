import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:second/features/task/presentation/pages/task_add_page.dart';

import '../bloc/task_entity_bloc.dart';
import 'building_page.dart';

class TaskListPage extends StatelessWidget {
  const TaskListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text(
              "Todo List",
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            GestureDetector(
              child: const Text(
                "Sort",
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              onTap: () {
                BlocProvider.of<TaskEntityBloc>(context)
                    .add(TaskEntitySortTaskEvent());
              },
            ),
          ],
        ),
        backgroundColor: Colors.white,
      ),
      body: const Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Tasks list",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            Expanded(
              child: Building(),
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
                    builder: (context) => CreatTaskPage(),
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
