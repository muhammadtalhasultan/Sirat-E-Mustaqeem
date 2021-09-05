import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/util/bloc/location/location_bloc.dart';
import '../../utils/loading_widget.dart';
import '../blocs/qibla_bloc/qibla_bloc.dart';
import '../widget/qibla_screen_scaffold.dart';

class QiblaScreen extends StatelessWidget {
  const QiblaScreen();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => QiblaBloc(),
      child: BlocBuilder<LocationBloc, LocationState>(
        builder: (context, state) {
          if (state is LocationLoading) {
            return Scaffold(
              body: LoadingWidget(),
            );
          }
          return QiblaScaffold();
        },
      ),
    );
  }
}
