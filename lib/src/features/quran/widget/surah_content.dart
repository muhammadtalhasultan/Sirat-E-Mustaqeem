import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/util/bloc/quran/quran_bloc.dart';
import '../../../core/util/constants.dart';
import '../bloc/selected_surah/selected_surah_bloc.dart';
import 'quran_card.dart';
import 'surah_scroll_selection.dart';

class SurahContent extends StatelessWidget {
  const SurahContent();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SelectedSurahBloc, SelectedSurahState>(
        builder: (context, currentSurahState) {
      return BlocBuilder<QuranBloc, QuranState>(builder: (context, quranState) {
        return SafeArea(
          bottom: false,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 32.w),
                        child: Text(
                          currentSurahState.surah.nameEn,
                          style: Theme.of(context)
                              .textTheme
                              .displaySmall!
                              .copyWith(
                                fontWeight: FontWeight.bold,
                                color: kDarkTextColor,
                              ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 32.w),
                        child: Text(
                          '${currentSurahState.surah.place} - ${currentSurahState.surah.ayats} ayat',
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(color: kDarkTextColor),
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  Padding(
                    padding: EdgeInsets.only(right: 16.w),
                    child: Text(
                      currentSurahState.surah.nameAr,
                      style:
                          Theme.of(context).textTheme.displayMedium!.copyWith(
                                color: kDarkTextColor,
                                fontFamily: 'Uthman',
                              ),
                    ),
                  )
                ],
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
                  child: ListView.builder(
                      itemCount: quranState.qurans
                          .getQuransBySurah(currentSurahState.surah.id)
                          .length,
                      itemBuilder: (context, index) {
                        return QuranCard(
                          quranState.qurans.getQuransBySurah(
                              currentSurahState.surah.id)[index],
                        );
                      }),
                ),
              ),
            ],
          ),
        );
      });
    });
  }
}
