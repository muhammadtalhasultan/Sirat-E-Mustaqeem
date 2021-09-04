part of 'notification_bloc.dart';

abstract class NotificationEvent extends Equatable {
  const NotificationEvent();

  @override
  List<Object> get props => [];
}

class UpdateNotification extends NotificationEvent {}

class ToggleNotification extends NotificationEvent {}
