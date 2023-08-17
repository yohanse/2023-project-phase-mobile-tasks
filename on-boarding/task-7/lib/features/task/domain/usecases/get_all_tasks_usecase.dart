import 'package:dartz/dartz.dart';
import 'package:second/features/task/domain/entities/task_entity.dart';
import 'package:second/features/task/domain/repositories/task_repositories.dart';

import '../../../../core/failure/failure.dart';

class GetAllTasksUsecase {
  final TaskRepository repository;
  GetAllTasksUsecase(this.repository);
  Future<Either<Failure, List<TaskEntity>>> call() async{
    return await repository.getAllTaskRepository();
  }
}
