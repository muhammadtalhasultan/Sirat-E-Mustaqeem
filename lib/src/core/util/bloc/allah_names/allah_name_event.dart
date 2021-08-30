part of 'allah_name_bloc.dart';

abstract class AllahNameEvent extends Equatable {
  const AllahNameEvent();
}

class FetchAllahName extends AllahNameEvent {
  final List<Map<String, Object?>> names;

  FetchAllahName(this.names);

  @override
  List<Object> get props => [names];
}
