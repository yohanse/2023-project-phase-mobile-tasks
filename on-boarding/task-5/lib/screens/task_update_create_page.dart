import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:second/BLOC/bloc_task.dart';
import 'package:second/BLOC/event.dart';
import 'package:second/Data/tasks_data.dart';

import '../widget/text_withtextfield.dart';

// ignore: must_be_immutable
class CreatOrUpdateTask extends StatelessWidget {
  final String defaultName, defaultDate, defaultDescription, buttonName;
  late TextEditingController mainName, date, description;
  final int index;
  CreatOrUpdateTask(
      {super.key,
      required this.buttonName,
      this.index = 0,
      this.defaultDate = "",
      this.defaultName = "",
      this.defaultDescription = ""}) {
    mainName = TextEditingController(text: defaultName);
    date = TextEditingController(text: defaultDate);
    description = TextEditingController(text: defaultDescription);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            buttonName,
            style: const TextStyle(
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
                  if (buttonName == "Add Task") {
                    BlocProvider.of<TaskBloc>(context).add(AddTask(
                        task: TaskData(
                            mainName.text, description.text, date.text)));
                  } else {
                    BlocProvider.of<TaskBloc>(context).add(UpdateTask(
        
                        index: index,
                        title: mainName.text,
                        date: date.text,
                        description: description.text));
                  }
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFEE6F57),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                child: Text(
                  buttonName,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
