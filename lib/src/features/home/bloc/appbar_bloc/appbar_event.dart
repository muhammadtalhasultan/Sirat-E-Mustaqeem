part of 'appbar_bloc.dart';

abstract class AppbarEvent extends Equatable {
  const AppbarEvent();

  @override
  List<Object> get props => [];
}

class ToggleDisplay extends AppbarEvent {}
