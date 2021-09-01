import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sirat_e_mustaqeem/src/core/util/constants.dart';

import '../bloc/selected_surah/selected_surah_bloc.dart';
import '../widget/surah_scroll_selection.dart';

class SelectedSurahScreen extends StatelessWidget {
  const SelectedSurahScreen();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SelectedSurahBloc, SelectedSurahState>(
      builder: (context, currentSurahState) {
        return Scaffold(
          backgroundColor: Theme.of(context).primaryColor,
          appBar: AppBar(
            backgroundColor: Theme.of(context).primaryColor,
            elevation: 0,
            title: Text(
              'Quran',
            ),
          ),
          body: SafeArea(
            bottom: false,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 32.w),
                  child: Text(
                    currentSurahState.surah.nameEn,
                    style: Theme.of(context).textTheme.headline3!.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 32.w),
                  child: Text(
                    '${currentSurahState.surah.place} - ${currentSurahState.surah.ayats} ayat',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ),
                SizedBox(
                  height: 8.h,
                ),
                SurahScrollSelection(),
                SizedBox(
                  height: 16.h,
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).scaffoldBackgroundColor,
                      borderRadius: kBottomSheetBorderRadius,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
