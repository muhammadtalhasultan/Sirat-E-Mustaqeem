import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/util/bloc/location/location_bloc.dart';
import '../../../core/util/bloc/notification/notification_bloc.dart';
import '../../../core/util/bloc/prayer_timing_bloc/timing_bloc.dart';
import '../../../core/util/constants.dart';
import '../../utils/loading_widget.dart';
import '../bloc/tab/tab_bloc.dart';
import 'sirat_bottom_tab.dart';

class TabScaffold extends StatefulWidget {
  const TabScaffold();

  @override
  State<TabScaffold> createState() => _TabScaffoldState();
}

class _TabScaffoldState extends State<TabScaffold> {
  @override
  void didChangeDependencies() {
    BlocProvider.of<TimingBloc>(context).add(
      RequestTiming(
        BlocProvider.of<NotificationBloc>(context).state.status,
        BlocProvider.of<LocationBloc>(context).state,
      ),
    );

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TimingBloc, TimingState>(
      builder: (context, state) {
        if (state is TimingLoading) {
          return Scaffold(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            body: LoadingWidget(),
          );
        }
        return Scaffold(
          // floatingActionButton: FloatingActionButton(
          //   onPressed: () async {
          //     await NotificationService().checkNotification();
          //   },
          // ),
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          extendBodyBehindAppBar: true,
          extendBody: true,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            toolbarHeight: 0,
            systemOverlayStyle:
                Theme.of(context).appBarTheme.systemOverlayStyle,
          ),
          bottomNavigationBar: SiratNavigationBar(),
          body: BlocBuilder<TabBloc, TabState>(
            builder: (context, state) {
              return AnimatedSwitcher(
                duration: kAnimationDuration,
                switchInCurve: kAnimationCurve,
                child: state.screen,
              );
            },
          ),
        );
      },
    );
  }
}
