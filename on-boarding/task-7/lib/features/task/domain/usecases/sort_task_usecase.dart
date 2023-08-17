import 'package:dartz/dartz.dart';

import '../../../../core/failure/failure.dart';
import '../repositories/task_repositories.dart';

class SortTAskUsecase {
  final TaskRepository repository;
  SortTAskUsecase(this.repository);
  Future<Either<Failure, bool>> call() async{
    return await repository.sortTaskRepository();
  }
}