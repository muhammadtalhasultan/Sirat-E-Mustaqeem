part of 'input_bloc.dart';

abstract class InputState extends Equatable {
  const InputState();

  @override
  List<Object> get props => [];
}

class InputInitial extends InputState {}

class InputError extends InputState {}

class InputCountError extends InputState {}

class InputNameError extends InputState {}
