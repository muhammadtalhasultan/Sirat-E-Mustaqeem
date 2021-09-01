part of 'tab_bloc.dart';

class TabState extends Equatable {
  final bool firstTab;
  const TabState(this.firstTab);

  @override
  List<Object> get props => [firstTab];
}
