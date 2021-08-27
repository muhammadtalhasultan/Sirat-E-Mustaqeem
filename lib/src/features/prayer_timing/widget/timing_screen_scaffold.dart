import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/util/constants.dart';
import '../../error/failure_widget.dart';
import '../../utils/loading_widget.dart';
import '../bloc/timing_bloc.dart';
import 'success_widget.dart';

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
                        ? FailureWidget(
                            state.failure,
                            () {
                              BlocProvider.of<TimingBloc>(context).add(
                                RequestTiming(),
                              );
                            },
                          )
                        : Container(),
          );
        },
      ),
    );
  }
}
