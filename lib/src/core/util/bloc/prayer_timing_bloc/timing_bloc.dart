import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../../core/util/controller/timing_controller.dart';
import '../../../error/failures.dart';
import '../../../notification/notification_service.dart';
import '../../model/timing.dart';
import '../location/location_bloc.dart';

part 'timing_event.dart';
part 'timing_state.dart';

class TimingBloc extends Bloc<TimingEvent, TimingState> {
  /// storage for data to prevent unneccessary api call
  Timing? _timing;
  List<Map<String, Object>> _notificationList = [];

  /// constructor
  TimingBloc() : super(TimingInitial());

  @override
  Stream<TimingState> mapEventToState(
    TimingEvent event,
  ) async* {
    /// normal request of api
    if (event is RequestTiming) {
      yield TimingLoading();

      if (!(event.locationState is LocationSuccess)) {
        yield TimingFailed(event.locationState.failure!);
      } else {
        var result = await getPrayerTiming(
          event.locationState.latitude,
          event.locationState.longitude,
        );

        yield* result.fold((l) async* {
          yield TimingFailed(l);
        }, (r) async* {
          /// checking for wheather the data is outdated.
          /// For example request data during night result in
          /// the data is outdated;
          ///
          final controller = TimingController(r.data.timings);

          /// if is outdated, request new data.
          if (controller.forTomorrow) {
            if (event.locationState.failure != null) {
              yield TimingFailed(event.locationState.failure!);
              return;
            }
            var result = await getPrayerTiming(
                event.locationState.latitude, event.locationState.longitude,
                forTomorrow: true);

            yield* result.fold((l) async* {
              yield TimingFailed(l);
            }, (r) async* {
              final controller = TimingController(r.data.timings);

              _notificationList =
                  await loadLocalNotification(controller.timingsList);

              if (event.notificationEnabled == PermissionStatus.granted)
                await addToLocalNotification(_notificationList);

              _timing = r;

              yield TimingLoaded(r);
            });
          } else {
            _notificationList =
                await loadLocalNotification(controller.timingsList);

            if (event.notificationEnabled == PermissionStatus.granted)
              await addToLocalNotification(_notificationList);

            _timing = r;

            yield TimingLoaded(r);
          }
        });
      }
    } else if (event is RequestTimingForTomorrow) {
      yield TimingLoading();

      if (event is LocationFailed) {
        yield TimingFailed(event.locationState.failure!);
        return;
      } else {
        var result = await getPrayerTiming(
          event.locationState.latitude,
          event.locationState.longitude,
          forTomorrow: true,
        );

        yield* result.fold((l) async* {
          yield TimingFailed(l);
        }, (r) async* {
          final controller = TimingController(r.data.timings);

          _notificationList =
              await loadLocalNotification(controller.timingsList);

          if (event.notificationEnabled == PermissionStatus.granted)
            await addToLocalNotification(_notificationList);

          _timing = r;

          yield TimingLoaded(r);
        });
      }
    }

    /// when initialize app and toggle switch
    ///
    else if (event is PushNotification) {
      await addToLocalNotification(_notificationList);
    }

    /// cancel all notification when toggle switch
    ///
    else if (event is CancelNotification) {
      await NotificationService().cancelAllNotifications();
    }

    /// if data is not yet outdated, we just update the data
    /// to the new [dataCount] from [TimingController]
    else if (event is UpdateTiming) {
      if (_timing != null) {
        final Timing timing = Timing(
          code: _timing!.code,
          data: _timing!.data,
          status: _timing!.status,
        );

        yield TimingLoaded(timing);
      }
    }
  }
}
