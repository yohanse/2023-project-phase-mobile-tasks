import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:second/bloc/event.dart';

import '../screens/favourite_screen.dart';
import '../screens/word_view_screen.dart';

class PageBloc extends Bloc<PageEvent, StatelessWidget> {
  PageBloc() : super(const WordViewScreen()) {
    on<FavouriteViewPage>((event, emit) {
      emit(const FavouriteScreen());
    });

    on<WordViewPage>((event, emit) {
      emit(const WordViewScreen());
    });
  }
}
