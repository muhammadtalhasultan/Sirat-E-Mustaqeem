import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

import '../../../core/util/constants.dart';
import '../bloc/percent/percent_bloc.dart';

class DownloadWidget extends StatelessWidget {
  const DownloadWidget();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: BlocBuilder<PercentBloc, PercentState>(
        builder: (context, state) {
          return Container(
            width: 1.sw,
            padding: kPagePadding,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: 500.w),
                  child: LottieBuilder.asset(
                    'assets/images/core/json/downloading.json',
                  ),
                ),
                SizedBox(
                  height: 16.h,
                ),
                Text('Downloading database...'),
                SizedBox(
                  height: 16.h,
                ),
                Container(
                  width: 0.7.sw,
                  height: 12.w,
                  alignment: Alignment.centerLeft,
                  decoration: ShapeDecoration(
                    shape: const StadiumBorder(),
                    color: Theme.of(context).colorScheme.background,
                  ),
                  child: Container(
                    width: state.percent / 100 * 0.7.sw,
                    height: double.infinity,
                    decoration: ShapeDecoration(
                      shape: const StadiumBorder(),
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
                SizedBox(
                  height: 8.h,
                ),
                Text(
                  '${state.percent.toStringAsFixed(2)}%',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor,
                      ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
