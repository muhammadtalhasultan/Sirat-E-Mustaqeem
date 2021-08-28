import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/util/bloc/prayer_timing_bloc/timing_bloc.dart';
import '../../../core/util/constants.dart';
import '../../../core/util/controller/timing_controller.dart';
import '../../../core/util/model/timing.dart';
import '../bloc/timer_bloc/timer_bloc.dart';
import '../controller/home_controller.dart';

class CountDownTimer extends StatefulWidget {
  const CountDownTimer(this.timings);

  final Timings timings;

  @override
  State<CountDownTimer> createState() => _CountDownTimerState();
}

class _CountDownTimerState extends State<CountDownTimer> {
  late final Timer timer;
  TimingController? controller;
  bool isInit = false;

  @override
  void initState() {
    super.initState();
    controller = TimingController(widget.timings);
  }

  @override
  void didChangeDependencies() {
    if (!isInit) {
      timer = Timer.periodic(
        Duration(seconds: 1),
        (_) {
          if (BlocProvider.of<TimerBloc>(context).state is TimerLoaded &&
              BlocProvider.of<TimerBloc>(context).state.difference ==
                  Duration.zero) {
            if (controller!.timingCount == 4) {
              BlocProvider.of<TimingBloc>(context)
                  .add(RequestTimingForTomorrow());
            } else {
              BlocProvider.of<TimingBloc>(context).add(UpdateTiming());
            }
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
          child: !(state is TimerLoaded)
              ? Container()
              : Text(
                  '${convertDurationCountdown(state.difference)} until Adhan',
                ),
        );
      },
    );
  }
}
