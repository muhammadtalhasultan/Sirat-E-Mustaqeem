import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/util/bloc/location/location_bloc.dart';
import '../../../core/util/bloc/prayer_timing_bloc/timing_bloc.dart';
import '../../../core/util/constants.dart';
import '../../error/widget/failure_widget.dart';
import '../../utils/loading_widget.dart';
import 'success_widget.dart';

class TimingScreenScaffold extends StatelessWidget {
  const TimingScreenScaffold();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor:
            Theme.of(context).appBarTheme.backgroundColor!.withOpacity(0.3),
        elevation: 0,
        title: Text('Prayer Timing'),
      ),
      body: BlocBuilder<TimingBloc, TimingState>(
        builder: (context, state) {
          return AnimatedSwitcher(
            duration: kAnimationDuration,
            reverseDuration: Duration.zero,
            switchInCurve: kAnimationCurve,
            child: (state is TimingLoading)
                ? LoadingWidget()
                : (state is TimingLoaded)
                    ? SuccessWidget(state.timing)
                    : (state is TimingFailed)
                        ? SafeArea(
                            child: FailureWidget(
                              state.failure,
                              () {
                                BlocProvider.of<LocationBloc>(context).add(
                                  InitLocation(),
                                );
                              },
                              withAppbar: true,
                            ),
                          )
                        : Container(),
          );
        },
      ),
    );
  }
}
