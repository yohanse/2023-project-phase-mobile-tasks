import 'package:dartz/dartz.dart';

import '../../../../core/failure/failure.dart';
import '../entities/task_entity.dart';
import '../repositories/task_repositories.dart';

class EditTAskUsecase {
  final TaskRepository repository;
  EditTAskUsecase(this.repository);
  Future<Either<Failure, bool>> call({required TaskEntity taskEntity}) async{
    return await repository.editTaskRepository(taskEntity: taskEntity);
  }
}