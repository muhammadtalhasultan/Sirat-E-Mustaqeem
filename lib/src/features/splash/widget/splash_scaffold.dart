import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../routes/routes.dart';
import '../../../core/util/bloc/database/database_bloc.dart';

class SplashScaffold extends StatelessWidget {
  const SplashScaffold();

  @override
  Widget build(BuildContext context) {
    return BlocListener<DatabaseBloc, DatabaseState>(
      listenWhen: (previous, current) {
        print(previous);
        print(current);
        return true;
      },
      listener: (context, state) {
        print(state);

        if (state is DatabaseLoaded) {
          Navigator.of(context).pushReplacementNamed(RouteGenerator.tabScreen);
        } else if (state is DatabaseFailed) {
          Navigator.of(context)
              .pushReplacementNamed(RouteGenerator.databaseError);
        }
      },
      child: Scaffold(
        body: Center(
          child: Text(
            'Splash Screen',
          ),
        ),
      ),
    );
  }
}
