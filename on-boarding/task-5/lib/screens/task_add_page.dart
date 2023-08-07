import 'package:flutter/material.dart';
import 'package:second/Data/all_tasks.dart';
import 'package:second/Data/tasks_data.dart';

import '../widget/text_withtextfield.dart';

// ignore: must_be_immutable
class CreatTask extends StatelessWidget {
  final Function function;
  CreatTask({super.key, required this.function});

  TextEditingController mainName = TextEditingController();
  TextEditingController date = TextEditingController();
  TextEditingController description = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            "Create new task",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 20,
              color: Colors.black,
            ),
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: Container(
        padding: const EdgeInsets.only(
          top: 20,
          right: 30,
          left: 30,
        ),
        child: ListView(
          children: [
            TextWithTextField(
              title: "Main task name",
              textController: mainName,
            ),
            const SizedBox(
              height: 20,
            ),
            TextWithTextField(
              title: "Due date",
              textController: date,
            ),
            const SizedBox(
              height: 20,
            ),
            TextWithTextField(
              title: "Description",
              textController: description,
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 120,
              ),
              child: ElevatedButton(
                onPressed: () {
                  allTasks.addTask(TaskData(mainName.text, date.text, description.text));
                  function();
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFEE6F57),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                child: const Text(
                  "Add task",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
