import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/event.dart';
import '../bloc/page_bloc.dart';
class FrontScreen extends StatelessWidget {
  final double width;
  const FrontScreen({super.key, required this.width});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SafeArea(
          child: NavigationRail(
            extended: width >= 600,
            destinations: const [
              NavigationRailDestination(
                icon: Icon(Icons.home),
                label: Text('Home'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.favorite),
                label: Text('Favorites'),
              ),
            ],
            selectedIndex: 0,
            onDestinationSelected: (value) {
              if (value == 0) {
                BlocProvider.of<PageBloc>(context).add(WordViewPage());
              } else {
                BlocProvider.of<PageBloc>(context).add(FavouriteViewPage());
              }
            },
          ),
        ),
        Expanded(
          child: Container(
            color: Theme.of(context).colorScheme.primaryContainer,
            child: Center(
              child: BlocBuilder<PageBloc, StatelessWidget>(
                  builder: (context, state) {
                return state;
              }),
            ),
          ),
        ),
      ],
    );
  }
}
