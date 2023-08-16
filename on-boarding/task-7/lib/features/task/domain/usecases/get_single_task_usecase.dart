import 'package:dartz/dartz.dart';
import 'package:second/features/task/domain/entities/task_entity.dart';
import 'package:second/features/task/domain/repositories/task_repositories.dart';

import '../../../../core/failure/failure.dart';

class GetSingleTaskUsecase {
  final TaskRepository repository;
  GetSingleTaskUsecase(this.repository);
  Future<Either<Failure, TaskEntity>> call({required int id}) async {
    return await repository.getSingleTaskRepository(id: id);
  }
}
