import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../core/util/bloc/notification/notification_bloc.dart';
import '../../../core/util/bloc/prayer_timing_bloc/timing_bloc.dart';
import '../widget/notification_disabled_dialog.dart';

void notificationSwitchOnToggle(NotificationState state, BuildContext context) {
  if (state.status == PermissionStatus.permanentlyDenied) {
    showDialog(
      context: context,
      builder: (context) => NotificationDisabledDialog(),
    );
  } else {
    if (state.status == PermissionStatus.granted) {
      BlocProvider.of<TimingBloc>(context).add(CancelNotification());
    } else if (state.status == PermissionStatus.restricted) {
      BlocProvider.of<TimingBloc>(context).add(PushNotification());
    }
    BlocProvider.of<NotificationBloc>(context).add(
      ToggleNotification(),
    );
  }
}
