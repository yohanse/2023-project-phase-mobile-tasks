import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/event.dart';
import '../bloc/event_bloc.dart';
import '../customize_widget/big_card.dart';

class WordViewScreen extends StatelessWidget {
  const WordViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        BlocBuilder<MyAppState, String>(builder: (context, state) {
          return BigCard(
            text: state,
          );
        }),
        const SizedBox(height: 10),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              onPressed: () =>
                  BlocProvider.of<MyAppState>(context).add(LikeEvent()),
              child: const Row(
                children: [
                  Icon(Icons.favorite_border),
                  SizedBox(width: 2),
                  Text("Like"),
                ],
              ),
            ),
            const SizedBox(width: 10),
            ElevatedButton(
              onPressed: () =>
                  BlocProvider.of<MyAppState>(context).add(NextEvent()),
              child: const Text("Next"),
            ),
          ],
        ),
      ],
    );
  }
}
