import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:second/features/task/domain/entities/task_entity.dart';
import 'package:second/features/task/presentation/bloc/task_entity_bloc.dart';

import '../widget/text_withtextfield.dart';

// ignore: must_be_immutable
class CreatTaskPage extends StatelessWidget {
  CreatTaskPage({super.key});

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
      body: BlocProvider<TaskEntityBloc>(
        create: (context) => TaskEntityBloc(),
        child: Container(
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
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Date",
                    style: TextStyle(
                      color: Color(0xFFEE6F57),
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  TextField(
                    controller: date,
                    maxLines: null,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                    ),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: "date",
                      hintStyle: const TextStyle(
                        color: Colors.grey,
                      ),
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ),
                        borderSide: BorderSide.none,
                      ),
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.date_range),
                        onPressed: () {
                          showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime.now(),
                            lastDate: DateTime(2024),
                          ).then((value) => {
                            date.text = value.toString().substring(0, 10)
                          });
                        },
                      ),
                    ),
                  ),
                ],
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
                    BlocProvider.of<TaskEntityBloc>(context)
                        .add(TaskEntityCreateTaskEvent(
                      TaskEntity(
                        title: mainName.text,
                        description: description.text,
                        notes: "programmer",
                        dueDate: DateTime.parse(date.text),
                      ),
                    ));
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
      ),
    );
  }
}
