import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sirat_e_mustaqeem/src/core/util/constants.dart';

import '../../../core/util/bloc/theme_bloc.dart';
import '../bloc/tab_bloc.dart';

class TabScreen extends StatelessWidget {
  const TabScreen();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => TabBloc(),
        child: Scaffold(
          backgroundColor: Theme.of(context).primaryColor,
          extendBodyBehindAppBar: true,
          extendBody: true,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            toolbarHeight: 0,
            systemOverlayStyle: SystemUiOverlayStyle.light,
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              BlocProvider.of<ThemeBloc>(context).add(
                ToggleTheme(),
              );
            },
          ),
          bottomNavigationBar: SiratNavigationBar(),
          body: SafeArea(
            child: CustomScrollView(
                keyboardDismissBehavior:
                    ScrollViewKeyboardDismissBehavior.onDrag,
                slivers: [
                  SliverAppBar(
                    leadingWidth: 0,
                    titleSpacing: 16.w,
                    title: Text(
                      'Assalamu’alaikum, sahabat',
                    ),
                    centerTitle: false,
                    actions: [
                      Padding(
                        padding: EdgeInsets.only(
                          right: 16.0.w,
                        ),
                        child: GestureDetector(
                          onTap: () {},
                          child: Icon(
                            Icons.notification_add,
                          ),
                        ),
                      )
                    ],
                    backgroundColor: Theme.of(context).primaryColor,
                    toolbarHeight: 50.h,
                    collapsedHeight: 50.h,
                    expandedHeight: 0.2.sh,
                    elevation: 0,
                    pinned: true,
                    floating: true,
                    snap: true,
                    flexibleSpace: FlexibleSpaceBar(
                      collapseMode: CollapseMode.parallax,
                      background: Container(
                        height: 0.2.sh,
                        padding: kPagePadding,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 50.h,
                            ),
                            Text(
                              'Yogyarkarta,',
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SliverList(
                    delegate: SliverChildListDelegate(
                      [
                        Column(
                          children: [
                            Container(
                              width: double.infinity,
                              height: 5.sh,
                              decoration: BoxDecoration(
                                color: Theme.of(context).backgroundColor,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(32.r),
                                  topRight: Radius.circular(32.r),
                                ),
                              ),
                              child: Text('123'),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ]),
          ),
        ));
  }
}

class SiratNavigationBar extends StatelessWidget {
  const SiratNavigationBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TabBloc, TabState>(
      builder: (context, state) {
        return BottomNavigationBar(
          backgroundColor: Theme.of(context).backgroundColor,
          type: BottomNavigationBarType.fixed,
          currentIndex: state.index,
          onTap: (index) => BlocProvider.of<TabBloc>(context).add(
            SetTab(index),
          ),
          selectedFontSize: 14.sp,
          unselectedFontSize: 14.sp,
          elevation: 0,
          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/home_nfill.svg',
                color: Theme.of(context)
                    .bottomNavigationBarTheme
                    .unselectedItemColor,
                width: 24.sp,
              ),
              label: 'Home',
              activeIcon: SvgPicture.asset(
                'assets/home_fill.svg',
                width: 24.sp,
              ),
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/quran_nfill.svg',
                width: 24.sp,
                color: Theme.of(context)
                    .bottomNavigationBarTheme
                    .unselectedItemColor,
              ),
              label: 'Quran',
              activeIcon: SvgPicture.asset(
                'assets/quran_fill.svg',
                width: 24.sp,
              ),
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/bookmark_nfill.svg',
                color: Theme.of(context)
                    .bottomNavigationBarTheme
                    .unselectedItemColor,
                width: 24.sp,
              ),
              label: 'Bookmark',
              activeIcon: SvgPicture.asset(
                'assets/bookmark_fill.svg',
                width: 24.sp,
              ),
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/setting_nfill.svg',
                color: Theme.of(context)
                    .bottomNavigationBarTheme
                    .unselectedItemColor,
                width: 24.sp,
              ),
              label: 'Setting',
              activeIcon: SvgPicture.asset(
                'assets/setting_fill.svg',
                width: 24.sp,
              ),
            ),
          ],
        );
      },
    );
  }
}
