part of 'name_bloc.dart';

class NameState extends Equatable {
  final AllahName name;

  const NameState(this.name);

  @override
  List<Object> get props => [name];
}
