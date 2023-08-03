import 'package:flutter/material.dart';
import 'package:second/BlOC/bloc_observer.dart';
import 'package:second/screens/counter_page.dart';

void main() {
  MyBlocObserver myBlocObserver = MyBlocObserver();
  runApp(const CounterApp());
}
