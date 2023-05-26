import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/util/bloc/quran/quran_bloc.dart';
import '../../../core/util/constants.dart';
import '../bloc/selected_juz/selected_juz_bloc.dart';
import 'juz_scroll_selection.dart';
import 'quran_card.dart';

class JuzContent extends StatelessWidget {
  const JuzContent();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SelectedJuzBloc, SelectedJuzState>(
      builder: (context, currentJuzState) {
        return BlocBuilder<QuranBloc, QuranState>(
          builder: (context, quranState) {
            return SafeArea(
              bottom: false,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 32.w),
                    child: Text(
                      currentJuzState.juz.englishName,
                      style: Theme.of(context).textTheme.displaySmall!.copyWith(
                            fontWeight: FontWeight.bold,
                            color: kDarkTextColor,
                          ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 32.w),
                    child: Text(
                      currentJuzState.juz.arabicName,
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            color: kDarkTextColor,
                            fontFamily: 'Uthman',
                          ),
                    ),
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  JuzScrollSelection(),
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
                              .getQuransByJuz(currentJuzState.juz.id)
                              .length,
                          itemBuilder: (context, index) {
                            return QuranCard(
                              quranState.qurans.getQuransByJuz(
                                  currentJuzState.juz.id)[index],
                            );
                          }),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
