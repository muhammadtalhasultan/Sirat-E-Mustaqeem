import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sirat_e_mustaqeem/src/core/error/failures.dart';
import 'package:sirat_e_mustaqeem/src/core/util/controller/location_controller.dart';
import 'package:sirat_e_mustaqeem/src/features/qibla/controller/qibla_controller.dart';

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
      final result = await getCurrentPosition();

      yield* result.fold((l) async* {
        yield QiblaFailed(l);
      }, (r) async* {
        final angle = calculateDirection(r);
        yield QiblaLoaded(angle);
      });
    }
  }
}
