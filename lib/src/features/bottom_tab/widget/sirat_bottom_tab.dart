import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../bloc/tab/tab_bloc.dart';

class SiratNavigationBar extends StatelessWidget {
  const SiratNavigationBar();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TabBloc, TabState>(
      builder: (context, state) {
        return BottomNavigationBar(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          type: BottomNavigationBarType.fixed,
          currentIndex: state.index,
          onTap: (index) => BlocProvider.of<TabBloc>(context).add(
            SetTab(index),
          ),
          selectedFontSize: Theme.of(context).textTheme.bodyMedium!.fontSize!,
          unselectedFontSize: Theme.of(context).textTheme.bodyMedium!.fontSize!,
          elevation: 0,
          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/images/navigation_icon/svg/home_nfill.svg',
                color: Theme.of(context)
                    .bottomNavigationBarTheme
                    .unselectedItemColor,
                width: 24.sp,
              ),
              label: 'Home',
              activeIcon: SvgPicture.asset(
                'assets/images/navigation_icon/svg/home_nfill.svg',
                color: Theme.of(context)
                    .bottomNavigationBarTheme
                    .selectedItemColor,
                width: 24.sp,
              ),
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/images/navigation_icon/svg/search.svg',
                color: Theme.of(context)
                    .bottomNavigationBarTheme
                    .unselectedItemColor,
                width: 24.sp,
              ),
              label: 'Search',
              activeIcon: SvgPicture.asset(
                'assets/images/navigation_icon/svg/search.svg',
                color: Theme.of(context)
                    .bottomNavigationBarTheme
                    .selectedItemColor,
                width: 24.sp,
              ),
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/images/navigation_icon/svg/quran_nfill.svg',
                width: 24.sp,
                color: Theme.of(context)
                    .bottomNavigationBarTheme
                    .unselectedItemColor,
              ),
              label: 'Quran',
              activeIcon: SvgPicture.asset(
                'assets/images/navigation_icon/svg/quran_nfill.svg',
                color: Theme.of(context)
                    .bottomNavigationBarTheme
                    .selectedItemColor,
                width: 24.sp,
              ),
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/images/navigation_icon/svg/bookmark_nfill.svg',
                color: Theme.of(context)
                    .bottomNavigationBarTheme
                    .unselectedItemColor,
                width: 24.sp,
              ),
              label: 'Bookmark',
              activeIcon: SvgPicture.asset(
                'assets/images/navigation_icon/svg/bookmark_nfill.svg',
                color: Theme.of(context)
                    .bottomNavigationBarTheme
                    .selectedItemColor,
                width: 24.sp,
              ),
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/images/navigation_icon/svg/setting_nfill.svg',
                color: Theme.of(context)
                    .bottomNavigationBarTheme
                    .unselectedItemColor,
                width: 24.sp,
              ),
              label: 'Setting',
              activeIcon: SvgPicture.asset(
                'assets/images/navigation_icon/svg/setting_nfill.svg',
                color: Theme.of(context)
                    .bottomNavigationBarTheme
                    .selectedItemColor,
                width: 24.sp,
              ),
            ),
          ],
        );
      },
    );
  }
}
