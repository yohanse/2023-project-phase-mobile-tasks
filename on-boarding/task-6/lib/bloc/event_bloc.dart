import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:english_words/english_words.dart';

import '../data/data_of_favourite.dart';
import 'event.dart';

class MyAppState extends Bloc<Event, String> {
  MyAppState() : super("hello") {
    on<NextEvent>((event, emit) {
      emit(WordPair.random().asLowerCase);
    });
    on<LikeEvent>((event, emit) {
      if (favouriteWord.contains(state)) {
        favouriteWord.remove(state);
      } else {
        favouriteWord.add(state);
      }
    });
  }
}
