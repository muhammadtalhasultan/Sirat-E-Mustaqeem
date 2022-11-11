// ignore_for_file: unnecessary_type_check

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';
import 'package:motion_sensors/motion_sensors.dart';

import '../blocs/angle_bloc/angle_bloc.dart';
import '../controller/qibla_controller.dart';

class Compass extends StatefulWidget {
  const Compass();

  @override
  _CompassState createState() => _CompassState();
}

class _CompassState extends State<Compass> {
  StreamSubscription<MagnetometerEvent>? _streamSubscription;

  @override
  void initState() {
    motionSensors.magnetometerUpdateInterval =
        Duration.microsecondsPerSecond ~/ 60;
    getMagnetometerAvailability().then((isSensorAvailable) {
      if (isSensorAvailable)
        _streamSubscription =
            motionSensors.magnetometer.listen((MagnetometerEvent event) {
          updateEvent(event, context);
        });
      else {
        BlocProvider.of<AngleBloc>(context).add(
          NotifyFailure(),
        );
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    _streamSubscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AngleBloc, AngleState>(
      builder: (context, state) {
        if (state is AngleLoaded)
          return Center(
            child: SizedBox(
              height: 0.5.sh,
              child: Transform.rotate(
                angle: state.radian,
                child: Stack(
                  children: [
                    SvgPicture.asset(
                      'assets/images/qiblat_icon/svg/kiblat_lingkar.svg',
                      height: 0.5.sh,
                    ),
                    if (state is AngleLoaded)
                      Positioned(
                        left: 0,
                        right: 0,
                        height: 0.5.sh,
                        child: Transform.rotate(
                          angle: state.qiblaDirection,
                          child: Column(
                            children: [
                              SizedBox(
                                height: 0.0625.sh,
                              ),
                              SvgPicture.asset(
                                'assets/images/qiblat_icon/svg/kiblat_needle.svg',
                                height: 0.25.sh,
                              ),
                              SizedBox(
                                height: 0.1875.sh,
                              )
                            ],
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          );
        else if (state is AngleFailed) {
          return Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                LottieBuilder.asset(
                  'assets/images/error/lottie_json/lost_compass.json',
                  width: 0.8.sw,
                ),
                Text(
                  'Unfortunately, compass for kiblah direction cannot be displayed '
                  'as this phone does not have the magnetometer sensor.',
                  textAlign: TextAlign.center,
                )
              ],
            ),
          );
        }
        return Container();
      },
    );
  }
}
