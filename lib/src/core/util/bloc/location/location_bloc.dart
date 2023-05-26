import 'package:equatable/equatable.dart';
import 'package:geocoding/geocoding.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

import '../../../error/failures.dart';
import '../../controller/location_controller.dart';

part 'location_event.dart';
part 'location_state.dart';

class LocationBloc extends HydratedBloc<LocationEvent, LocationState> {
  Placemark? _address;

  Placemark? get address => _address;

  LocationBloc()
      : super(LocationInitial(
          91,
          181,
          LocalFailure(
            error: 0,
            message: 'initializing',
          ),
        )) {
    on<LocationEvent>((event, emit) async {
      if (event is InitLocation) {
        emit(LocationLoading(state.latitude, state.longitude));
        final result = await getCurrentPosition();

        result.fold(
            (l) => emit(LocationFailed(state.latitude, state.longitude, l)),
            (r) async {
          // TODO: Null issues here
          // final address = await getAddress(r.latitude, r.longitude);

          // address.fold(
          //   (l) => null,
          //   (r) => log('RLOGGOING ${r.results[0].formattedAddress}'),
          // );

          emit(LocationSuccess(r.latitude, r.longitude));
        });
      }
    });
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

// Future<Placemark?> getAddressFromLatLng(double lat, double lng) async {
//   try {

//     List<Placemark> placemarks = await placemarkFromCoordinates(lat, lng);

//     if (placemarks.isNotEmpty) {
//       final Placemark pos = placemarks[0];
//       // log(' LOGGING: \n ${pos.thoroughfare}, ${pos.locality}, ${pos.administrativeArea} ${pos.postalCode}');
//       return pos;
//     }
//   } catch (e) {
//     log(e.toString());
//   }
//   return null;
// }
