import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/util/bloc/database/database_bloc.dart';
import '../widget/failure_widget.dart';

class DatabaseErrorScreen extends StatelessWidget {
  const DatabaseErrorScreen();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DatabaseBloc, DatabaseState>(
      builder: (context, state) {
        if (state is DatabaseFailed)
          return Scaffold(
            body: SafeArea(
              child: FailureWidget(
                state.failure,
                () {},
              ),
            ),
          );
        return Scaffold();
      },
    );
  }
}
