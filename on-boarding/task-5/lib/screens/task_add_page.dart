import 'package:flutter/material.dart';

import '../widget/text_withtextfield.dart';

class CreatTask extends StatelessWidget {
  const CreatTask({super.key});

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
              textController: TextEditingController(),
            ),
            const SizedBox(
              height: 20,
            ),
            TextWithTextField(
              title: "Due date",
              textController: TextEditingController(),
            ),
            const SizedBox(
              height: 20,
            ),
            TextWithTextField(
              title: "Description",
              textController: TextEditingController(),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 120,),
              child: ElevatedButton(
                onPressed: () {},
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
