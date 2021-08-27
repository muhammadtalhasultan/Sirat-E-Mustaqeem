import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sirat_e_mustaqeem/src/core/notification/notification_service.dart';
import 'package:sirat_e_mustaqeem/src/core/util/constants.dart';
import 'package:sirat_e_mustaqeem/src/core/util/controller/notification_controller.dart';

import '../bloc/tab_bloc.dart';
import '../widget/sirat_bottom_tab.dart';

class TabScreen extends StatefulWidget {
  const TabScreen();

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  @override
  void initState() {
    configureDidReceiveLocalNotificationSubject(context);
    configureSelectNotificationSubject(context);
    super.initState();
  }

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
