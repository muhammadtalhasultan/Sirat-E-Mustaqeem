import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/tab/tab_bloc.dart';
import '../cubit/quran_cubit.dart';
import '../widget/quran_scaffold.dart';

class QuranScreen extends StatefulWidget {
  const QuranScreen({this.fromNav = false});

  final bool fromNav;

  @override
  State<QuranScreen> createState() => _QuranScreenState();
}

class _QuranScreenState extends State<QuranScreen> {
  late final PageController controller;

  @override
  void initState() {
    controller = PageController(initialPage: 0);

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => TabBloc(controller),
        ),
        BlocProvider(
          create: (context) => QuranCubit(widget.fromNav),
        ),
      ],
      child: QuranScaffold(),
    );
  }
}
