import 'dart:convert';
import 'package:second/core/failure/exception.dart';
import 'package:second/features/task/data/datasource/data.dart';
import 'package:second/features/task/data/models/task_model.dart';

abstract class LocalDataSource {
  Future<bool> setTaskEntityModelLocalDataSource(
      {required TaskEntityModel taskEntityModel});
  Future<int> getLastTaskEntityModelId();
  Future<TaskEntityModel> getSingleTaskEntityModel({required int id});
  Future<List<TaskEntityModel>> getAllTaskEntityModel();
  Future<bool> editTaskEntityLocalDataSource(
      {required TaskEntityModel taskEntityModel});
}

class LocalDataSourceImpl implements LocalDataSource {
  @override
  Future<List<TaskEntityModel>> getAllTaskEntityModel() async {
    try {
      List<TaskEntityModel> allTaskEntityModel =
          List.generate(allData.length, (index) {
        var parsedJson = jsonDecode(allData[index]);
        return TaskEntityModel.fromJson(parsedJson);
      });
      return allTaskEntityModel;
    } catch (e) {
      return throw ProvideDataException("can not provide data");
    }
  }

  @override
  Future<int> getLastTaskEntityModelId() async {
    try {
      int nextId = allData.length;
      return nextId;
    } catch (e) {
      return throw ProvideIdException("can not provide id");
    }
  }

  @override
  Future<TaskEntityModel> getSingleTaskEntityModel({required int id}) async {
    try {
      var parsedJson = jsonDecode(allData[id]);
      TaskEntityModel taskEntityModel = TaskEntityModel.fromJson(parsedJson);
      return taskEntityModel;
    } catch (e) {
      return throw ProvideDataException("can not provide data");
    }
  }

  @override
  Future<bool> setTaskEntityModelLocalDataSource(
      {required TaskEntityModel taskEntityModel}) async {
    try {
      Map<String, dynamic> json = taskEntityModel.toJson();
      String encodedJson = jsonEncode(json);
      allData.add(encodedJson);
      return true;
    } catch (e) {
      return throw SetDataException("shut fuck up");
    }
  }

  @override
  Future<bool> editTaskEntityLocalDataSource(
      {required TaskEntityModel taskEntityModel}) async {
    try {
      Map<String, dynamic> json = taskEntityModel.toJson();
      String encodedJson = jsonEncode(json);
      allData[taskEntityModel.id] = encodedJson;
      return true;
    } catch (e) {
      return throw SetDataException("shut fuck up");
    }
  }
}
