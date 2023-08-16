import 'package:flutter/material.dart';
import 'custom_text_widget.dart';

class CustomColumn extends StatelessWidget {
  final String title, text;
  final double height;
  const CustomColumn(
      {super.key,
      required this.title,
      required this.height,
      required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CoustomText(
          title: title,
        ),
        const SizedBox(height: 3),
        Container(
            padding: const EdgeInsets.all(10),
            height: height,
            width: double.infinity,
            color: const Color(0xFFF1EEEE),
            child: Text(text)),
      ],
    );
  }
}
