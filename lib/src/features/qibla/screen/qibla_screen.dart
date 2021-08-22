import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

import '../../../core/error/failures.dart';
import '../../../core/util/constants.dart';
import '../../error/failure_widget.dart';
import '../blocs/angle_bloc/angle_bloc.dart';
import '../blocs/qibla_bloc/qibla_bloc.dart';
import '../widget/compass.dart';

class QiblaScreen extends StatelessWidget {
  const QiblaScreen();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => QiblaBloc(),
      child: QiblaScaffold(),
    );
  }
}

class QiblaScaffold extends StatefulWidget {
  const QiblaScaffold({
    Key? key,
  }) : super(key: key);

  @override
  State<QiblaScaffold> createState() => _QiblaScaffoldState();
}

class _QiblaScaffoldState extends State<QiblaScaffold> {
  @override
  void didChangeDependencies() {
    BlocProvider.of<QiblaBloc>(context).add(
      RequestQiblahDirection(),
    );
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Qiblah Direction',
        ),
      ),
      body: BlocBuilder<QiblaBloc, QiblaState>(
        builder: (context, state) {
          return AnimatedSwitcher(
            duration: kAnimationDuration,
            reverseDuration: Duration.zero,
            switchInCurve: kAnimationCurve,
            child: (state is QiblaLoading)
                ? Center(
                    child: ConstrainedBox(
                      constraints: BoxConstraints(maxWidth: 500.w),
                      child: LottieBuilder.asset(
                        'assets/loading.json',
                      ),
                    ),
                  )
                : (state is QiblaLoaded)
                    ? SafeArea(
                        child: Container(
                          width: 1.sw,
                          padding: kPagePadding,
                          child: Column(
                            children: [
                              Column(
                                children: [
                                  SizedBox(
                                    height: 32.h,
                                  ),
                                  Text(
                                    state.direction.toStringAsFixed(0),
                                  ),
                                ],
                              ),
                              Expanded(
                                child: BlocProvider(
                                  create: (context) => AngleBloc(),
                                  child: Compass(),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    : (state is QiblaFailed)
                        ? FailureWidget(
                            state.failure,
                            () {
                              BlocProvider.of<QiblaBloc>(context).add(
                                RequestQiblahDirection(),
                              );
                            },
                          )
                        : Container(),
          );
        },
      ),
    );
  }
}
