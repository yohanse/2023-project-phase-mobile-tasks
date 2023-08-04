import 'package:flutter/material.dart';

import '../Data/all_tasks_data.dart';

class TaskWidget extends StatelessWidget {
  final int index;
  final Function() navigationDetail;
  const TaskWidget({
    super.key,
    required this.index,
    required this.navigationDetail,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: navigationDetail,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
              color: Colors.grey, // Set the border color to gray
              width: 2.0, // Set the border width
            ),
          borderRadius: const BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.symmetric(vertical:10),
        child: Row(
          children: [
            Text(
              data[index][0][0],
              style: const TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            Expanded(
              flex: 2,
              child: Text(
                data[index][0],
                style: const TextStyle(
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Text(
                "${data[index][1].day}/${data[index][1].month}/${data[index][1].year}",
                textAlign: TextAlign.end,
              ),
            )
          ],
        ),
      ),
    );
  }
}
