import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:motion_sensors/motion_sensors.dart';
import 'package:vector_math/vector_math.dart' show radians;

import '../../controller/qibla_controller.dart';

part 'angle_event.dart';
part 'angle_state.dart';

class AngleBloc extends Bloc<AngleEvent, AngleState> {
  final double qiblaDirection;

  AngleBloc(this.qiblaDirection) : super(AngleInitial(0, 0)) {
    on<AngleEvent>((event, emit) async {
      if (event is SetMagnetometerValue) {
        double angle = getCompassAngle(event.events);

        double rad = radians(angle);

        /// further prevent noise which is less than 0.5 deg(0.008 rad)
        if (state.radian - rad > 0.008 || rad - state.radian > 0.008) {
          emit(AngleLoaded(
            angle: angle,
            radian: rad,
            qiblaDirection: radians(qiblaDirection),
          ));
        }
      } else if (event is NotifyFailure) {
        emit(AngleFailed(0, 0));
      }
    });
  }
}
