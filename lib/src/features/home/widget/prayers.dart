import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/util/bloc/prayer_timing_bloc/timing_bloc.dart';
import '../../../core/util/bloc/time_format/time_format_bloc.dart';
import '../../../core/util/constants.dart';
import '../../../core/util/controller/timing_controller.dart';

class Prayers extends StatelessWidget {
  const Prayers();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TimingBloc, TimingState>(
      builder: (context, state) {
        TimingController? controller;

        if (state is TimingLoaded)
          controller = TimingController(state.timing.data.timings);

        return AnimatedSwitcher(
          duration: kAnimationDuration,
          reverseDuration: Duration.zero,
          switchInCurve: kAnimationCurve,
          child: !(state is TimingLoaded)
              ? Text('--')
              : Row(
                  children: [
                    Text(
                      controller!.prayer,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    SizedBox(
                      width: 4.w,
                    ),
                    BlocBuilder<TimeFormatBloc, TimeFormatState>(
                      builder: (context, timeFormatState) {
                        return Text(
                          timeFormatState.is24
                              ? controller!.time
                              : convertTimeTo12HourFormat(controller!.time),
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                          ),
                        );
                      },
                    ),
                  ],
                ),
        );
      },
    );
  }
}
