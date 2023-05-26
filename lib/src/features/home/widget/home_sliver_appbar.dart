import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/util/constants.dart';
import '../bloc/appbar_bloc/appbar_bloc.dart';
import 'appbar_expanded.dart';

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
                    'Sirate Mustaqeem',
                    style: Theme.of(context).textTheme.headlineSmall,
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
                    'assets/images/home_icon/svg/noti.svg',
                    width: 24.w,
                    color: Theme.of(context).textTheme.bodyMedium!.color,
                  ),
                ),
              ),
          ],
          toolbarHeight: 50,
          collapsedHeight: 50,
          expandedHeight: 0.35.sh,
          elevation: 0,
          pinned: true,
          floating: false,
          snap: false,
          flexibleSpace: FlexibleSpaceBar(
            collapseMode: CollapseMode.pin,
            background: AppBarExpanded(),
          ),
        );
      },
    );
  }
}
