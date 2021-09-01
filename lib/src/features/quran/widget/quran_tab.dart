import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sirat_e_mustaqeem/src/core/util/constants.dart';
import 'package:sirat_e_mustaqeem/src/features/quran/bloc/tab/tab_bloc.dart';

class QuranTab extends StatelessWidget {
  const QuranTab();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TabBloc, TabState>(
      builder: (context, state) {
        return Container(
          width: double.infinity,
          margin: kPagePadding,
          decoration: BoxDecoration(
            borderRadius: kCardBorderRadius,
            color: Theme.of(context).colorScheme.background,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: () {
                  if (!state.firstTab)
                    BlocProvider.of<TabBloc>(context).add(ToggleTab());
                },
                child: AnimatedContainer(
                  duration: kAnimationDuration,
                  curve: kAnimationCurve,
                  padding: EdgeInsets.symmetric(
                    horizontal: 12.w,
                    vertical: 12.h,
                  ),
                  decoration: BoxDecoration(
                    border: state.firstTab
                        ? Border(
                            bottom: BorderSide(
                              color: Theme.of(context).primaryColor,
                              width: 2.sp,
                            ),
                          )
                        : Border(),
                  ),
                  child: Text(
                    'Surah',
                    style: Theme.of(context).textTheme.headline6!.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  if (state.firstTab)
                    BlocProvider.of<TabBloc>(context).add(ToggleTab());
                },
                child: AnimatedContainer(
                  duration: kAnimationDuration,
                  curve: kAnimationCurve,
                  padding: EdgeInsets.symmetric(
                    horizontal: 12.w,
                    vertical: 12.h,
                  ),
                  decoration: BoxDecoration(
                    border: !state.firstTab
                        ? Border(
                            bottom: BorderSide(
                              color: Theme.of(context).primaryColor,
                              width: 2.sp,
                            ),
                          )
                        : Border(),
                  ),
                  child: Text(
                    'Juz',
                    style: Theme.of(context).textTheme.headline6!.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
