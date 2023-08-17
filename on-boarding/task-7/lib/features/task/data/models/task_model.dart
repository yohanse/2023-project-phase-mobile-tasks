import 'package:second/features/task/domain/entities/task_entity.dart';

class TaskEntityModel extends TaskEntity {
  final int id;
  final String title, description, notes;
  final DateTime dueDate, creationDate;
  final bool isCompleted;

  const TaskEntityModel(
      {required this.creationDate,
      required this.id,
      required this.isCompleted,
      required this.title,
      required this.description,
      required this.notes,
      required this.dueDate})
      : super(
            description: description,
            title: title,
            notes: notes,
            dueDate: dueDate);

  factory TaskEntityModel.fromJson(Map<String, dynamic> json) {
    return TaskEntityModel(
        title: json['title'],
        description: json['description'],
        notes: json['notes'],
        dueDate: DateTime.parse(json['dueDate']),
        creationDate: DateTime.parse(json['creationDate']),
        isCompleted: json['isCompleted'],
        id: json['id']);
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'notes': notes,
      'dueDate': dueDate.toIso8601String(),
      'creationDate': creationDate.toIso8601String(),
      'isCompleted': isCompleted,
      'id': id,
    };
  }
}
