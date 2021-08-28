import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../routes/routes.dart';
import '../../../core/util/bloc/prayer_timing_bloc/timing_bloc.dart';
import '../../../core/util/controller/date_controller.dart';
import '../../../core/util/controller/timing_controller.dart';
import '../bloc/timer_bloc/timer_bloc.dart';
import 'countdown_timer.dart';
import 'prayers.dart';

class PrayerTimingWidget extends StatelessWidget {
  const PrayerTimingWidget();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(RouteGenerator.prayerTimingPage);
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            getTodayDate(),
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'Next Prayer Timing:',
            style: Theme.of(context).textTheme.bodyText1,
          ),
          Prayers(),
          BlocBuilder<TimingBloc, TimingState>(
            builder: (context, state) {
              if (state is TimingLoaded) {
                final controller = TimingController(state.timing.data.timings);
                return BlocProvider.value(
                  value: TimerBloc(controller.timing),
                  child: CountDownTimer(state.timing.data.timings),
                );
              }
              return Container();
            },
          )
        ],
      ),
    );
  }
}
