import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:second/BlOC/event.dart';

import '../BlOC/bloc_count.dart';

class CounterApp extends StatelessWidget {
  const CounterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Counter App"),
        ),
        body: BlocBuilder(builder: (context, snapshot) {
          return Center(
            child: Text(
              "$snapshot",
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w800,
              ),
            ),
          );
        }),
        floatingActionButton: Row(
          children: [
            FloatingActionButton(
              onPressed: () => CounterBloc().add(IncreamentEvent()),
              child: const Icon(
                Icons.add,
                size: 20,
              ),
            ),
            FloatingActionButton(
              onPressed: () => CounterBloc().add(IncreamentEvent()),
              child: const Icon(
                Icons.remove,
                size: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
