import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:second/BLOC/observer.dart';
import 'package:second/screens/initial_page.dart';

import 'BLOC/bloc_task.dart';

void main() {
  MyObserver myobserver = MyObserver();
  runApp(
    BlocProvider<TaskBloc>(
      create: (context) => TaskBloc(),
      child: const MaterialApp(
        home: InitialPage(),
      ),
    ),
  );
}
