import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sirat_e_mustaqeem/src/core/util/bloc/database/database_bloc.dart';
import 'package:sirat_e_mustaqeem/src/features/error/widget/failure_widget.dart';

class DatabaseErrorScreen extends StatelessWidget {
  const DatabaseErrorScreen();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DatabaseBloc, DatabaseState>(
      builder: (context, state) {
        if (state is DatabaseFailed)
          return Scaffold(
            body: FailureWidget(state.failure, () {}),
          );
        return Scaffold();
      },
    );
  }
}
