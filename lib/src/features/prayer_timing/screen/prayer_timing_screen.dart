import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

import '../../../core/util/bloc/theme_bloc.dart';
import '../bloc/timing_bloc.dart';

class PrayerTimingScreen extends StatelessWidget {
  const PrayerTimingScreen();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TimingBloc(),
      child: TimingScreenScaffold(),
    );
  }
}

class TimingScreenScaffold extends StatefulWidget {
  const TimingScreenScaffold();

  @override
  State<TimingScreenScaffold> createState() => _TimingScreenScaffoldState();
}

class _TimingScreenScaffoldState extends State<TimingScreenScaffold> {
  @override
  void didChangeDependencies() {
    BlocProvider.of<TimingBloc>(context).add(RequestTiming());
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          BlocProvider.of<ThemeBloc>(context).add(ToggleTheme());
        },
      ),
      appBar: AppBar(
        title: Text('prayer timing'),
        systemOverlayStyle: Theme.of(context).brightness == Brightness.dark
            ? SystemUiOverlayStyle.light
            : SystemUiOverlayStyle.dark,
      ),
      body: BlocBuilder<TimingBloc, TimingState>(
        builder: (context, state) {
          return AnimatedSwitcher(
            duration: Duration(milliseconds: 300),
            reverseDuration: Duration(microseconds: 0),
            switchInCurve: Curves.easeInOut,
            child: (state is TimingLoading)
                ? Center(
                    child: ConstrainedBox(
                      constraints: BoxConstraints(maxWidth: 500.w),
                      child: LottieBuilder.asset(
                        'assets/loading.json',
                      ),
                    ),
                  )
                : (state is TimingLoaded)
                    ? Column(
                        children: [
                          Text(state.timing.data.timings.asr),
                          ElevatedButton(
                            onPressed: () {},
                            child: Text(
                              '123',
                            ),
                          )
                        ],
                      )
                    : Container(),
          );
        },
      ),
    );
  }
}
