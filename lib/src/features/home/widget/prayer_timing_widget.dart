import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../routes/routes.dart';
import '../../../core/util/constants.dart';
import '../../../core/util/controller/date_controller.dart';
import '../bloc/prayer_timing_bloc/prayer_timing_bloc.dart';
import '../bloc/timer_bloc/timer_bloc.dart';
import 'countdown_timer.dart';

class PrayerTimingWidget extends StatefulWidget {
  const PrayerTimingWidget();

  @override
  State<PrayerTimingWidget> createState() => _PrayerTimingWidgetState();
}

class _PrayerTimingWidgetState extends State<PrayerTimingWidget> {
  bool isInit = false;
  @override
  void didChangeDependencies() {
    if (!isInit) {
      BlocProvider.of<PrayerTimingBloc>(context).add(RequestTiming());

      isInit = true;
    }

    super.didChangeDependencies();
  }

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
          BlocBuilder<PrayerTimingBloc, PrayerTimingState>(
            builder: (context, state) {
              return AnimatedSwitcher(
                duration: kAnimationDuration,
                reverseDuration: Duration.zero,
                switchInCurve: kAnimationCurve,
                child: state.timing == '' && state.prayer == ''
                    ? Text('--')
                    : Row(
                        children: [
                          Text(
                            state.prayer,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                          SizedBox(
                            width: 4.w,
                          ),
                          Text(
                            state.timing,
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                        ],
                      ),
              );
            },
          ),
          BlocBuilder<PrayerTimingBloc, PrayerTimingState>(
            builder: (context, state) {
              if (state.timing != '') {
                return BlocProvider.value(
                  value: TimerBloc(state.timing),
                  child: CountDownTimer(),
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
