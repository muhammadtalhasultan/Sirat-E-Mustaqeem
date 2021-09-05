import 'dart:async';
import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../notification/notification_service.dart';

part 'notification_event.dart';
part 'notification_state.dart';

class NotificationBloc
    extends HydratedBloc<NotificationEvent, NotificationState> {
  NotificationBloc()
      : super(
          NotificationState(
            Platform.isIOS ? PermissionStatus.denied : PermissionStatus.granted,
          ),
        );

  @override
  Stream<NotificationState> mapEventToState(
    NotificationEvent event,
  ) async* {
    if (event is UpdateNotification) {
      if (Platform.isIOS) {
        final permission = await Permission.notification.status;
        if (permission.isGranted && state.status.isRestricted) {
          yield NotificationState(PermissionStatus.restricted);
        } else {
          yield NotificationState(permission);
        }
      }
    }
    if (event is ToggleNotification) {
      if (state.status == PermissionStatus.denied) {
        final permission = await Permission.notification.request();
        yield NotificationState(permission);
      } else if (state.status == PermissionStatus.permanentlyDenied) {
        yield NotificationState(PermissionStatus.permanentlyDenied);
      } else if (state.status == PermissionStatus.restricted) {
        yield NotificationState(PermissionStatus.granted);
      } else if (state.status == PermissionStatus.granted) {
        await NotificationService().cancelAllNotifications();
        yield NotificationState(PermissionStatus.restricted);
      }
    }
  }

  @override
  NotificationState? fromJson(Map<String, dynamic> json) {
    try {
      PermissionStatus status = PermissionStatus.denied;
      switch (json['status'] as int) {
        case 1:
          status = PermissionStatus.denied;
          break;
        case 2:
          status = PermissionStatus.permanentlyDenied;
          break;
        case 3:
          status = PermissionStatus.granted;
          break;
        case 4:
          status = PermissionStatus.restricted;
          break;

        default:
          status = PermissionStatus.denied;
      }
      return NotificationState(status);
    } catch (e) {
      return null;
    }
  }

  @override
  Map<String, dynamic>? toJson(NotificationState state) {
    try {
      int value = 0;
      switch (state.status) {
        case PermissionStatus.denied:
          value = 1;
          break;
        case PermissionStatus.permanentlyDenied:
          value = 2;
          break;
        case PermissionStatus.granted:
          value = 3;
          break;
        case PermissionStatus.restricted:
          value = 4;
          break;
        default:
          value = 0;
      }
      return {
        'status': value,
      };
    } catch (e) {
      return null;
    }
  }
}
