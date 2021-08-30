part of 'database_bloc.dart';

abstract class DatabaseEvent extends Equatable {
  const DatabaseEvent();
}

class InitDatabase extends DatabaseEvent {
  final BuildContext context;

  InitDatabase(this.context);

  @override
  List<Object> get props => [context];
}
