import 'package:flutter/material.dart';
import 'package:second/BLOC/observer.dart';
import 'package:second/screens/initial_page.dart';

void main() {
  MyObserver myobserver = MyObserver();
  runApp(
    const MaterialApp(
      home: InitialView(),
    ),
  );
}
