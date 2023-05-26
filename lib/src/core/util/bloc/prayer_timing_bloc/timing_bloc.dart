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
  TimingBloc() : super(TimingInitial()) {
    on<TimingEvent>((event, emit) async {
      if (event is RequestTiming) {
        emit(TimingLoading());

        if (!(event.locationState is LocationSuccess)) {
          emit(TimingFailed(event.locationState.failure!));
        } else {
          Timing result = await getPrayerTiming(
            event.locationState.latitude,
            event.locationState.longitude,
          );

          emit(TimingLoaded(result));
        }
      } else if (event is RequestTimingForTomorrow) {
        emit(TimingLoading());

        if (event is LocationFailed) {
          emit(TimingFailed(event.locationState.failure!));
          return;
        } else {
          var result = await getPrayerTiming(
            event.locationState.latitude,
            event.locationState.longitude,
            forTomorrow: true,
          );

          result.fold((l) async* {
            emit(TimingFailed(l));
          }, (r) async* {
            final controller = TimingController(r.data.timings);

            _notificationList =
                await loadLocalNotification(controller.timingsList);

            if (event.notificationEnabled == PermissionStatus.granted)
              await addToLocalNotification(_notificationList);

            _timing = r;

            emit(TimingLoaded(r));
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

          emit(TimingLoaded(timing));
        }
      }
    });
  }
}
