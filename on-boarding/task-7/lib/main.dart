import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:second/features/task/presentation/bloc/task_entity_bloc.dart';
import 'features/task/presentation/pages/initial_page.dart';

void main() {
  runApp(
    BlocProvider<TaskEntityBloc>(
      create: (c) => TaskEntityBloc(),
      child: const MaterialApp(
        home: InitialPage(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const InitialPage();
  }
}
