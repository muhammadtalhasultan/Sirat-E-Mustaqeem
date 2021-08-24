import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/timing_bloc.dart';
import '../widget/timing_screen_scaffold.dart';

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
