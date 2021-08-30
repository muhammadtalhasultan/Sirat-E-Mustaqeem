import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sirat_e_mustaqeem/src/core/error/failures.dart';
import 'package:sirat_e_mustaqeem/src/features/error/widget/failure_widget.dart';

import '../bloc/percent/percent_bloc.dart';
import '../download/download_bloc.dart';

class DownloadScaffold extends StatefulWidget {
  const DownloadScaffold();

  @override
  State<DownloadScaffold> createState() => _DownloadScaffoldState();
}

class _DownloadScaffoldState extends State<DownloadScaffold> {
  bool isInit = false;
  @override
  void didChangeDependencies() {
    if (!isInit) {
      BlocProvider.of<DownloadBloc>(context).add(DownloadDatabase(context));
      isInit = true;
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<DownloadBloc, DownloadState>(
          builder: (context, state) {
            if (state is DownloadDone) {
              return Center(
                child: Text(
                    'All set! You are ready to use \'Sirate Mustaqueem\'! Welcome aboard!'),
              );
            }
            if (state is DownloadFailed) {
              return FailureWidget(state.failure, () {});
            }
            return Center(
              child: BlocBuilder<PercentBloc, PercentState>(
                builder: (context, state) {
                  return Text(
                    state.percent.toString(),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
