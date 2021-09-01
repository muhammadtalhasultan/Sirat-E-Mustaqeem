import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/util/bloc/surah/surah_bloc.dart';
import '../../../core/util/constants.dart';
import 'quran_tab.dart';
import 'surah_card.dart';

class QuranScaffold extends StatelessWidget {
  const QuranScaffold();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Quran',
        ),
        actions: [
          GestureDetector(
            onTap: () async {},
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
            onTap: () async {},
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 16.w,
              ),
              child: SvgPicture.asset(
                'assets/images/navigation_icon/svg/search.svg',
                width: 24.w,
                color: kDarkTextColor,
              ),
            ),
          )
        ],
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 32.w),
              child: Text(
                'Al-Qur\'an',
                style: Theme.of(context).textTheme.headline2!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
            SizedBox(
              height: 16.h,
            ),
            QuranTab(),
            BlocBuilder<SurahBloc, SurahState>(
              builder: (context, state) {
                return Expanded(
                  child: ListView.builder(
                      itemCount: state.surahs.surahs.length,
                      itemBuilder: (context, index) {
                        return SurahCard(
                          state.surahs,
                          index,
                        );
                      }),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
