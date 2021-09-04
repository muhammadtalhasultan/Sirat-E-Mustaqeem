part of 'notification_bloc.dart';

class NotificationState extends Equatable {
  final PermissionStatus status;
  const NotificationState(this.status);

  @override
  List<Object> get props => [status];
}
