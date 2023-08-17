import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:second/features/task/presentation/pages/task_detail.dart';

import '../bloc/task_entity_bloc.dart';
import '../widget/widget_task.dart';
class Building extends StatelessWidget {
  const Building({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskEntityBloc, TaskEntityState>(
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
                      builder: (context) =>
                          TaskDetailView(task: state.listOfTaskEntity[index]),
                    ),
                  );
                },
              );
            },
            itemCount: state.listOfTaskEntity.length,
          );
        }
        return Container();
      },
    );
  }
}
