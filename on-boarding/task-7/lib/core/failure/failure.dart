import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  String get message;
}

class DataProvideFailure implements Failure {
  @override
  final String message;

  DataProvideFailure(this.message);

  @override
  List<Object?> get props => [];

  @override
  bool? get stringify => false;
}

class IdProvideFailure implements Failure {
  @override
  final String message;

  IdProvideFailure(this.message);

  @override
  List<Object?> get props => [];

  @override
  bool? get stringify => false;
}

class LocalDataBaseFailure implements Failure {
  @override
  final String message;

  LocalDataBaseFailure(this.message);
  @override
  List<Object?> get props => [];

  @override
  bool? get stringify => false;
}
