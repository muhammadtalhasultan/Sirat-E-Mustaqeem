import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sirat_e_mustaqeem/src/core/error/failures.dart';

import '../../error/widget/failure_widget.dart';
import '../download/download_bloc.dart';
import 'download_widget.dart';
import 'success_widget.dart';

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
              return SuccessWidget();
            }
            if (state is DownloadFailed) {
              return FailureWidget(
                state.failure,
                () {
                  if (state.failure is RemoteFailure) {
                    BlocProvider.of<DownloadBloc>(context).add(
                      DownloadDatabase(context),
                    );
                  }
                },
              );
            }
            return DownloadWidget();
          },
        ),
      ),
    );
  }
}
