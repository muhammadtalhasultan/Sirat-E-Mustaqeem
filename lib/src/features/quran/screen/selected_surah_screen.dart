import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/util/bloc/quran/quran_bloc.dart';
import '../../../core/util/constants.dart';
import '../../bottom_tab/bloc/tab/tab_bloc.dart';
import '../bloc/selected_surah/selected_surah_bloc.dart';
import '../cubit/quran_cubit.dart' as qc;
import '../widget/quran_card.dart';
import '../widget/surah_scroll_selection.dart';

class SelectedSurahScreen extends StatelessWidget {
  const SelectedSurahScreen();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SelectedSurahBloc, SelectedSurahState>(
      builder: (context, currentSurahState) {
        return BlocBuilder<QuranBloc, QuranState>(
          builder: (context, quranState) {
            return Scaffold(
              backgroundColor: Theme.of(context).primaryColor,
              appBar: AppBar(
                backgroundColor: Theme.of(context).primaryColor,
                elevation: 0,
                actions: [
                  GestureDetector(
                    onTap: () {
                      if (!BlocProvider.of<qc.QuranCubit>(context)
                          .state
                          .fromNav) Navigator.of(context).pop();
                      Navigator.of(context).pop();
                      BlocProvider.of<TabBloc>(context).add(SetTab(3));
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16.w,
                      ),
                      child: SvgPicture.asset(
                        'assets/images/navigation_icon/svg/bookmark_nfill.svg',
                        width: 24.w,
                        color: kDarkTextColor,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      if (!BlocProvider.of<qc.QuranCubit>(context)
                          .state
                          .fromNav) Navigator.of(context).pop();
                      Navigator.of(context).pop();
                      BlocProvider.of<TabBloc>(context).add(SetTab(4));
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16.w,
                      ),
                      child: SvgPicture.asset(
                        'assets/images/navigation_icon/svg/setting_nfill.svg',
                        width: 24.w,
                        color: kDarkTextColor,
                      ),
                    ),
                  )
                ],
              ),
              body: SafeArea(
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
                                    .headline3!
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
                                    .headline6!
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
                                Theme.of(context).textTheme.headline2!.copyWith(
                                      color: kDarkTextColor,
                                      fontFamily: 'uthman',
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
              ),
            );
          },
        );
      },
    );
  }
}
