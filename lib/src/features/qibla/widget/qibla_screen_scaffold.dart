import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sirat_e_mustaqeem/src/features/qibla/controller/qibla_controller.dart';

import '../../../core/util/constants.dart';
import '../../error/failure_widget.dart';
import '../../utils/loading_widget.dart';
import '../blocs/angle_bloc/angle_bloc.dart';
import '../blocs/qibla_bloc/qibla_bloc.dart';
import 'compass.dart';

class QiblaScaffold extends StatefulWidget {
  const QiblaScaffold();

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
      extendBody: true,
      extendBodyBehindAppBar: true,
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
                ? LoadingWidget()
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
                                  Text('Qiblah direction is '),
                                  Text(
                                    '${state.direction.toStringAsFixed(0)}°',
                                    style:
                                        Theme.of(context).textTheme.headline5,
                                  ),
                                  Text(
                                    getDirectionText(
                                      state.direction.floor(),
                                    ),
                                  ),
                                ],
                              ),
                              Expanded(
                                child: BlocProvider.value(
                                  value: AngleBloc(state.direction),
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
