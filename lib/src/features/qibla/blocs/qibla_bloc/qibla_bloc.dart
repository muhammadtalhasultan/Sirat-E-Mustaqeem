import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/util/bloc/location/location_bloc.dart';
import '../../controller/qibla_controller.dart';

part 'qibla_event.dart';
part 'qibla_state.dart';

class QiblaBloc extends Bloc<QiblaEvent, QiblaState> {
  QiblaBloc() : super(QiblaInitial());

  @override
  Stream<QiblaState> mapEventToState(
    QiblaEvent event,
  ) async* {
    if (event is RequestQiblahDirection) {
      yield QiblaLoading();

      if (event.locationState is LocationFailed) {
        yield QiblaFailed(event.locationState.failure!);
      } else {
        final angle = calculateDirection(
          event.locationState.latitude,
          event.locationState.longitude,
        );
        yield QiblaLoaded(angle);
      }
    }
  }
}
