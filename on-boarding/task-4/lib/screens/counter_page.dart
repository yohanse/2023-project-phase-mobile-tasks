import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:second/BlOC/event.dart';

import '../BlOC/bloc_count.dart';

class CounterApp extends StatelessWidget {
  const CounterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Counter App"),
      ),
      body: BlocBuilder<CounterBloc, int>(
        builder: (context, state) {
          return Center(
            child: Text(
              "$state",
              style: const TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.w800,
              ),
            ),
          );
        },
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () => BlocProvider.of<CounterBloc>(context).add(IncreamentEvent()),
            child: const Icon(
              Icons.add,
              size: 30,
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          FloatingActionButton(
            onPressed: () => BlocProvider.of<CounterBloc>(context).add(DecreamentEvent()),
            child: const Icon(
              Icons.remove,
              size: 30,
            ),
          ),
        ],
      ),
    );
  }
}
