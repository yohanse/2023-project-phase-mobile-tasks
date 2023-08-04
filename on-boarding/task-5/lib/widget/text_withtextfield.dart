import 'package:flutter/material.dart';

class TextWithTextField extends StatelessWidget {
  final String title;
  final TextEditingController textController;
  const TextWithTextField(
      {super.key, required this.title, required this.textController});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: Color(0xFFEE6F57),
            fontSize: 15,
            fontWeight: FontWeight.w600,
          ),
        ),
        TextField(
          maxLines: null,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
          ),
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            hintText: title,
            hintStyle: const TextStyle(
              color: Colors.grey,
            ),
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(15),
              ),
              borderSide: BorderSide.none,
            ),
            suffixIcon: title == "Due date"
                ? const Icon(
                    Icons.date_range,
                    color: Color(0xFFEE6F57),
                  )
                : null,
          ),
        ),
      ],
    );
  }
}
