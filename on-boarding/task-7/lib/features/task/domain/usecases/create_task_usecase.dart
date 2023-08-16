import 'package:dartz/dartz.dart';
import 'package:second/features/task/domain/entities/task_entity.dart';
import 'package:second/features/task/domain/repositories/task_repositories.dart';

import '../../../../core/failure/failure.dart';

class CreateTAskUsecase {
  final TaskRepository repository;
  CreateTAskUsecase(this.repository);
  Future<Either<Failure, bool>> call({required TaskEntity taskEntity}) async{
    return await repository.createTaskRepository(taskEntity: taskEntity);
  }
}