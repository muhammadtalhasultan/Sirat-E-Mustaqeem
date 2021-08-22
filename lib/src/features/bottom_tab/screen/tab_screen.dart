import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sirat_e_mustaqeem/src/core/util/constants.dart';

import '../../../core/util/bloc/theme_bloc.dart';
import '../../home/screen/home_screen.dart';
import '../bloc/tab_bloc.dart';
import '../widget/sirat_bottom_tab.dart';

class TabScreen extends StatelessWidget {
  const TabScreen();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TabBloc(),
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        extendBodyBehindAppBar: true,
        extendBody: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          toolbarHeight: 0,
          systemOverlayStyle: Theme.of(context).appBarTheme.systemOverlayStyle,
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
      ),
    );
  }
}
