import 'package:equatable/equatable.dart';

class TaskEntity extends Equatable {
  final String title, description, notes;
  final int? id;
  final DateTime dueDate;
  final DateTime? creationDate;
  final bool? isCompleted;

  const TaskEntity(
      {required this.title,
      required this.description,
      required this.notes,
      this.id,
      required this.dueDate,
      this.creationDate,
      this.isCompleted});

  @override
  List<Object> get props =>
      [title, description, notes, dueDate];
}
