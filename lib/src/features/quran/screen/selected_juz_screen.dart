import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/util/bloc/quran/quran_bloc.dart';
import '../../../core/util/constants.dart';
import '../../bottom_tab/bloc/tab/tab_bloc.dart';
import '../bloc/selected_juz/selected_juz_bloc.dart';
import '../cubit/quran_cubit.dart' as qc;
import '../widget/juz_scroll_selection.dart';
import '../widget/quran_card.dart';

class SelectedJuzScreen extends StatelessWidget {
  const SelectedJuzScreen();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SelectedJuzBloc, SelectedJuzState>(
      builder: (context, currentJuzState) {
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
                      BlocProvider.of<TabBloc>(context).add(SetTab(4));
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
                    Padding(
                      padding: EdgeInsets.only(left: 32.w),
                      child: Text(
                        currentJuzState.juz.englishName,
                        style: Theme.of(context).textTheme.headline3!.copyWith(
                              fontWeight: FontWeight.bold,
                              color: kDarkTextColor,
                            ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 32.w),
                      child: Text(
                        currentJuzState.juz.arabicName,
                        style: Theme.of(context).textTheme.headline6!.copyWith(
                              color: kDarkTextColor,
                              fontFamily: 'uthman',
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
              ),
            );
          },
        );
      },
    );
  }
}
