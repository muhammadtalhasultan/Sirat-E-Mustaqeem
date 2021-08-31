part of 'input_bloc.dart';

abstract class InputEvent extends Equatable {
  const InputEvent();

  @override
  List<Object> get props => [];
}

class SetInputError extends InputEvent {}

class SetInputNameError extends InputEvent {}

class SetInputCountError extends InputEvent {}
