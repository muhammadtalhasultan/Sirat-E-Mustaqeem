import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/percent/percent_bloc.dart';
import '../download/download_bloc.dart';
import '../widget/download_scaffold.dart';

class DownloadScreen extends StatelessWidget {
  const DownloadScreen();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => DownloadBloc(),
        ),
        BlocProvider(
          create: (context) => PercentBloc(),
        ),
      ],
      child: DownloadScaffold(),
    );
  }
}
