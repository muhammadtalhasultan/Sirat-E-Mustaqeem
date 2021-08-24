import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/util/constants.dart';
import '../bloc/prayer_timing_bloc/prayer_timing_bloc.dart';
import '../bloc/timer_bloc/timer_bloc.dart';
import '../controller/home_controller.dart';

class CountDownTimer extends StatefulWidget {
  const CountDownTimer();

  @override
  State<CountDownTimer> createState() => _CountDownTimerState();
}

class _CountDownTimerState extends State<CountDownTimer> {
  late final Timer timer;
  bool isInit = false;

  @override
  void didChangeDependencies() {
    if (!isInit) {
      timer = Timer.periodic(
        Duration(seconds: 1),
        (_) {
          if (BlocProvider.of<TimerBloc>(context).state is TimerLoaded &&
              BlocProvider.of<TimerBloc>(context).state.difference ==
                  Duration.zero) {
            BlocProvider.of<PrayerTimingBloc>(context).add(RequestTiming());
          }

          BlocProvider.of<TimerBloc>(context).add(
            TimerTick(),
          );
        },
      );

      isInit = true;
    }

    super.didChangeDependencies();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TimerBloc, TimerState>(
      builder: (context, state) {
        return AnimatedSwitcher(
          duration: kAnimationDuration,
          reverseDuration: Duration.zero,
          switchInCurve: kAnimationCurve,
          child: state.difference == Duration.zero
              ? Container()
              : Text(
                  '${convertDurationCountdown(state.difference)} until Azan',
                ),
        );
      },
    );
  }
}
