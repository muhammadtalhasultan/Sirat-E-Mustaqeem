import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/util/controller/notification_controller.dart';

import '../bloc/tab/tab_bloc.dart';
import '../widget/tab_scaffold.dart';

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
      child: TabScaffold(),
    );
  }
}
