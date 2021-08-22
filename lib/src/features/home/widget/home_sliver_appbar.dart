import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/util/constants.dart';
import '../bloc/appbar_bloc.dart';
import 'kiblat_card.dart';

class HomeSliverAppbar extends StatelessWidget {
  const HomeSliverAppbar();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppbarBloc, AppbarState>(
      builder: (context, state) {
        return SliverAppBar(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          systemOverlayStyle: Theme.of(context).appBarTheme.systemOverlayStyle,
          centerTitle: false,
          titleSpacing: 16.w,
          title: AnimatedSwitcher(
            duration: kAnimationDuration,
            switchInCurve: kAnimationCurve,
            reverseDuration: Duration.zero,
            child: state.displayAppbar
                ? Text(
                    'Sirat',
                    style: Theme.of(context).textTheme.headline6,
                  )
                : Text(''),
          ),
          actions: [
            if (state.displayAppbar)
              Padding(
                padding: EdgeInsets.only(right: 16.w),
                child: GestureDetector(
                  onTap: () {},
                  child: SvgPicture.asset(
                    'assets/home_icon/svg/noti.svg',
                    width: 24.w,
                    color: Theme.of(context).textTheme.bodyText2!.color,
                  ),
                ),
              ),
          ],
          toolbarHeight: 50.h,
          collapsedHeight: 50.h,
          expandedHeight: 0.35.sh,
          elevation: 0,
          pinned: true,
          floating: true,
          snap: false,
          flexibleSpace: FlexibleSpaceBar(
            collapseMode: CollapseMode.pin,
            background: Container(
              width: 1.sw,
              height: 0.2.sh,
              child: Stack(
                children: [
                  SizedBox(
                    width: 1.sw,
                    height: 0.3.sh,
                    child: Theme.of(context).brightness == Brightness.dark
                        ? SvgPicture.asset(
                            'assets/home_icon/svg/night_mode.svg',
                            fit: BoxFit.cover,
                          )
                        : SvgPicture.asset(
                            'assets/home_icon/svg/day_mode.svg',
                            fit: BoxFit.cover,
                          ),
                  ),
                  Container(
                    width: 1.sw,
                    height: 0.3.sh,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Theme.of(context).primaryColor.withOpacity(0.5),
                          Colors.transparent,
                        ],
                        stops: [0.2, 1],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                  ),
                  SafeArea(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          'Assalamu’alaikum, sahabat',
                          style: Theme.of(context).textTheme.headline6,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 16.w,
                          ),
                          child: KiblatCard(),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
