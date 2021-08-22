part of 'appbar_bloc.dart';

class AppbarState extends Equatable {
  final bool displayAppbar;

  const AppbarState(this.displayAppbar);

  @override
  List<Object> get props => [displayAppbar];
}
