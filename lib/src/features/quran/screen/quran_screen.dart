import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/tab/tab_bloc.dart';
import '../widget/quran_scaffold.dart';

class QuranScreen extends StatelessWidget {
  const QuranScreen();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TabBloc(),
      child: QuranScaffold(),
    );
  }
}
