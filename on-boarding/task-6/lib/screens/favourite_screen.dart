import 'package:flutter/material.dart';
import 'package:second/data/data_of_favourite.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("You have ${favouriteWord.length} favorites"),
        Expanded(
          child: ListView.builder(
            itemBuilder: (context, index) {
              return ListTile(
                leading: const Icon(Icons.favorite),
                title: Text(favouriteWord[index]),
              );
            },
            itemCount: favouriteWord.length,
          ),
        ),
      ],
    );
  }
}
