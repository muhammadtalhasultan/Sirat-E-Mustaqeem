part of 'database_bloc.dart';

abstract class DatabaseState extends Equatable {
  const DatabaseState();
}

class DatabaseInitial extends DatabaseState {
  @override
  List<Object> get props => [];
}

class DatabaseLoaded extends DatabaseState {
  @override
  List<Object> get props => [];
}

class DatabaseFailed extends DatabaseState {
  final Failure failure;

  DatabaseFailed(this.failure);

  @override
  List<Object> get props => [failure];
}
