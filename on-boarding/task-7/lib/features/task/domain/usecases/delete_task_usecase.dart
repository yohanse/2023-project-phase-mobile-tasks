import 'package:dartz/dartz.dart';

import '../../../../core/failure/failure.dart';
import '../entities/task_entity.dart';
import '../repositories/task_repositories.dart';

class DeleteTAskUsecase {
  final TaskRepository repository;
  DeleteTAskUsecase(this.repository);
  Future<Either<Failure, bool>> call({required int id}) async{
    return await repository.deleteTaskRepository(id: id);
  }
}