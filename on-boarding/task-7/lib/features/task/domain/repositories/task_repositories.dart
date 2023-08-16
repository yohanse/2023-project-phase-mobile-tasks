import 'package:dartz/dartz.dart';
import 'package:second/features/task/domain/entities/task_entity.dart';

import '../../../../core/failure/failure.dart';

abstract class TaskRepository {
  Future<Either<Failure, bool>> createTaskRepository(
      {required TaskEntity taskEntity});
  Future<Either<Failure, List<TaskEntity>>> getAllTaskRepository();
  Future<Either<Failure, TaskEntity>> getSingleTaskRepository(
      {required int id});
      
}
