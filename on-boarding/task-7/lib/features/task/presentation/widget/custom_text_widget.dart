import 'package:flutter/material.dart';

class CoustomText extends StatelessWidget {
  final String title;
  CoustomText({required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
