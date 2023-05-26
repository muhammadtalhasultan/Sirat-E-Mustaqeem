import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/util/constants.dart';
import '../bloc/selected_tasbih/selected_tasbih_bloc.dart';
import '../widget/circle_progress.dart';

class SelectedTasbihScreen extends StatelessWidget {
  const SelectedTasbihScreen();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SelectedTasbihBloc, SelectedTasbihState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Tasbih'),
          ),
          body: SafeArea(
            child: Center(
              child: Column(
                children: [
                  SizedBox(
                    height: 32.h,
                  ),
                  Padding(
                    padding: kPagePadding,
                    child: Text(
                      state.tasbih.name,
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .copyWith(fontFamily: 'Uthman'),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      BlocProvider.of<SelectedTasbihBloc>(context)
                          .add(AddCounter());
                    },
                    child: Container(
                      width: 1.sw,
                      height: 0.6.sh,
                      color: Theme.of(context).scaffoldBackgroundColor,
                      child: Stack(
                        children: [
                          Container(
                            width: 1.sw,
                            height: 0.6.sh,
                            padding: kPagePadding,
                            child: CustomPaint(
                              foregroundPainter: CircleProgress(
                                  currentProgress:
                                      state.count / state.tasbih.counter * 100,
                                  foregroundColor:
                                      Theme.of(context).primaryColor,
                                  backgroundColor:
                                      Theme.of(context).colorScheme.background,
                                  strokeWidth: 8.sp),
                            ),
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  state.count.toString(),
                                  style: Theme.of(context)
                                      .textTheme
                                      .displayLarge!
                                      .copyWith(
                                        color: Theme.of(context).primaryColor,
                                      ),
                                ),
                                Text(
                                  '/ ${state.tasbih.counter}',
                                  style: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            8.r,
                          ),
                        ),
                      ),
                      minimumSize: MaterialStateProperty.all(
                        Size(
                          0,
                          56.h,
                        ),
                      ),
                    ),
                    onPressed: () {
                      BlocProvider.of<SelectedTasbihBloc>(context)
                          .add(ResetCounter());
                    },
                    child: SvgPicture.asset(
                      'assets/images/tasbih_icon/svg/restart.svg',
                      color: kDarkTextColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
