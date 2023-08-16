import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:second/features/task/presentation/pages/task_add_page.dart';
import 'package:second/features/task/presentation/pages/task_detail.dart';

import '../bloc/task_entity_bloc.dart';
import '../widget/widget_task.dart';

class TaskListPage extends StatelessWidget {
  const TaskListPage({super.key});

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
              child: BlocBuilder<TaskEntityBloc, TaskEntityState>(
                builder: (context, state) {
                  if (state is LoadingState) {
                    return const Center(
                      child: Text("Loading"),
                    );
                  } else if (state is ErrorState) {
                    return Center(
                      child: Text(state.message),
                    );
                  } else if (state is AllTaskEntitySucessState) {
                    return ListView.builder(
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          child: TaskWidget(
                            task: state.listOfTaskEntity[index],
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => TaskDetailView(
                                    task: state.listOfTaskEntity[index]),
                              ),
                            );
                          },
                        );
                      },
                      itemCount: state.listOfTaskEntity.length,
                    );
                  }
                  return const Center(
                    child: Text("nothing"),
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
