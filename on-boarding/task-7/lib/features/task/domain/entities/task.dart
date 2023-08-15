import 'package:equatable/equatable.dart';

class Task extends Equatable {
  final String title, description, notes;
  final int id;
  final DateTime dueDate, creationDate;
  final bool isCompleted;

  const Task({
      required this.title,
      required this.description,
      required this.notes,
      required this.id,
      required this.dueDate,
      required this.creationDate,
      required this.isCompleted});

  @override
  List<Object> get props => [title, description, notes, id, dueDate, creationDate, isCompleted];
}
