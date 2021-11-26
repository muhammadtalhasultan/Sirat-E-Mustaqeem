import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

import '../../../error/failures.dart';
import '../../controller/location_controller.dart';

part 'location_event.dart';
part 'location_state.dart';

class LocationBloc extends HydratedBloc<LocationEvent, LocationState> {
  /// max latitude is 90 and max longitude is 180
  LocationBloc()
      : super(
          LocationInitial(
            91,
            181,
            LocalFailure(
              error: 0,
              message: 'initializing',
            ),
          ),
        );

  @override
  Stream<LocationState> mapEventToState(
    LocationEvent event,
  ) async* {
    if (event is InitLocation) {
      if (state.latitude > 90 && state.longitude > 180) {
        yield LocationLoading(state.latitude, state.longitude);

        final result = await getCurrentPosition();

        yield* result.fold((l) async* {
          yield LocationFailed(state.latitude, state.longitude, l);
        }, (r) async* {
          // final address = await getAddress(r.latitude, r.longitude);
          // address.fold(
          //     (l) => null, (r) => print(r.results[0].formattedAddress));

          yield LocationSuccess(r.latitude, r.longitude);
        });
      }
    }
  }

  @override
  LocationState? fromJson(Map<String, dynamic> json) {
    try {
      LocalFailure? failure;
      if ((json['error'] as int?) != null) {
        failure = LocalFailure(
          error: json['error'] as int,
          message: json['message'].toString(),
          extraInfo: json['extraInfo']?.toString(),
        );
        return LocationFailed(
          json['latitude'] as double,
          json['longitude'] as double,
          failure,
        );
      } else {
        return LocationSuccess(
          json['latitude'] as double,
          json['longitude'] as double,
        );
      }
    } catch (e) {
      return null;
    }
  }

  @override
  Map<String, dynamic>? toJson(LocationState state) {
    try {
      return {
        'latitude': state.latitude,
        'longitude': state.longitude,
        'error': state.failure?.error,
        'message': state.failure?.message,
        'extraInfo': state.failure?.extraInfo,
      };
    } catch (e) {
      return null;
    }
  }
}
