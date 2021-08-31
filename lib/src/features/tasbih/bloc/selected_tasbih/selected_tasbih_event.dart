part of 'selected_tasbih_bloc.dart';

abstract class SelectedTasbihEvent extends Equatable {
  const SelectedTasbihEvent();

  @override
  List<Object> get props => [];
}

class AddCounter extends SelectedTasbihEvent {}

class ResetCounter extends SelectedTasbihEvent {}
