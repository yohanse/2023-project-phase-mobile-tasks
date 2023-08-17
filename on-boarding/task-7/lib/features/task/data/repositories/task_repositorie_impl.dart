import 'package:dartz/dartz.dart';
import 'package:second/core/failure/failure.dart';
import 'package:second/features/task/data/datasource/local_data_source.dart';
import 'package:second/features/task/data/models/task_model.dart';
import 'package:second/features/task/domain/entities/task_entity.dart';
import 'package:second/features/task/domain/repositories/task_repositories.dart';

class TaskRepositoryImpl implements TaskRepository {
  final LocalDataSource localDataSource;

  TaskRepositoryImpl(this.localDataSource);

  @override
  Future<Either<Failure, bool>> createTaskRepository(
      {required TaskEntity taskEntity}) async {
    try {
      TaskEntityModel taskEntityModel = TaskEntityModel(
          creationDate: DateTime(2023, 8, 16),
          id: await localDataSource.getLastTaskEntityModelId(),
          isCompleted: false,
          title: taskEntity.title,
          description: taskEntity.description,
          notes: taskEntity.notes,
          dueDate: taskEntity.dueDate);
      await localDataSource.setTaskEntityModelLocalDataSource(
          taskEntityModel: taskEntityModel);
      return const Right(true);
    } catch (e) {
      print("lisping");
      return Left(
        LocalDataBaseFailure(
          e.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<Failure, List<TaskEntity>>> getAllTaskRepository() async {
    try {
      List<TaskEntity> listofTaskModel =
          await localDataSource.getAllTaskEntityModel();
      return Right(listofTaskModel);
    } catch (e) {
      return Left(
        DataProvideFailure(
          e.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<Failure, TaskEntity>> getSingleTaskRepository(
      {required int id}) async {
    try {
      TaskEntityModel singleTaskEnitiyModel =
          await localDataSource.getSingleTaskEntityModel(id: id);
      return Right(singleTaskEnitiyModel);
    } catch (e) {
      return Left(
        DataProvideFailure(
          e.toString(),
        ),
      );
    }
  }
  
  @override
  Future<Either<Failure, bool>> editTaskRepository({required TaskEntity taskEntity}) async{
    try {
      TaskEntityModel taskEntityModel = TaskEntityModel(
          creationDate: taskEntity.creationDate!,
          id: taskEntity.id!,
          isCompleted: taskEntity.isCompleted!,
          title: taskEntity.title,
          description: taskEntity.description,
          notes: taskEntity.notes,
          dueDate: taskEntity.dueDate);
      await localDataSource.editTaskEntityLocalDataSource(
          taskEntityModel: taskEntityModel);
      return const Right(true);
    } catch (e) {
      return Left(
        LocalDataBaseFailure(
          e.toString(),
        ),
      );
    }
  }
}
