import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/util/constants.dart';
import '../../bottom_tab/bloc/tab/tab_bloc.dart';
import '../cubit/quran_cubit.dart' as qc;
import '../widget/juz_content.dart';
import '../widget/surah_content.dart';
import 'option_screen.dart';

class SelectedQuranScreen extends StatelessWidget {
  const SelectedQuranScreen({required this.surah});

  final bool surah;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 0,
        actions: [
          GestureDetector(
            onTap: () {
              if (!BlocProvider.of<qc.QuranCubit>(context).state.fromNav)
                Navigator.of(context).pop();
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
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => OptionScreen(),
                ),
              );
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
      body: surah ? SurahContent() : JuzContent(),
    );
  }
}
