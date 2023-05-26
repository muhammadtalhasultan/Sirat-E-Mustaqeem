import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/util/constants.dart';
import '../../../core/util/model/dua.dart';
import '../bloc/dropdown/dropdown_bloc.dart';
import 'dua_card.dart';

class DuaCategoryCard extends StatelessWidget {
  const DuaCategoryCard(this.surah, this.index);

  final MapEntry<String, List<Dua>> surah;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            BlocProvider.of<DropdownBloc>(context).add(
              ToggleDropdown(),
            );
          },
          child: Container(
            width: double.infinity,
            margin: kPagePadding,
            padding: kCardPadding,
            decoration: BoxDecoration(
              borderRadius: kCardBorderRadius,
              color: Theme.of(context).primaryColor.withOpacity(0.2),
            ),
            child: Row(
              children: [
                Container(
                  width: 28.w,
                  height: 28.w,
                  padding: EdgeInsets.symmetric(
                    vertical: 4.w,
                    horizontal: 8.w,
                  ),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Theme.of(context).primaryColor,
                      width: 2.sp,
                    ),
                  ),
                  child: FittedBox(
                    child: Text(
                      index.toString(),
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    surah.key,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          fontFamily: 'Jameel',
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
                BlocBuilder<DropdownBloc, DropdownState>(
                  builder: (context, state) {
                    return SvgPicture.asset(
                      state.expanded
                          ? 'assets/images/dua_icon/svg/riseup.svg'
                          : 'assets/images/dua_icon/svg/dropdown.svg',
                      color: Theme.of(context).primaryColor,
                      width: 24.w,
                    );
                  },
                ),
              ],
            ),
          ),
        ),
        BlocBuilder<DropdownBloc, DropdownState>(
          builder: (context, state) {
            return AnimatedSwitcher(
              duration: kAnimationDuration,
              switchInCurve: kAnimationCurve,
              reverseDuration: Duration.zero,
              child: state.expanded
                  ? Column(
                      children: List.generate(surah.value.length, (index) {
                        return Padding(
                          padding: index == 0
                              ? EdgeInsets.only(
                                  top: 8.h,
                                  bottom: 4.0.h,
                                )
                              : EdgeInsets.symmetric(
                                  vertical: 4.0.h,
                                ),
                          child: DuaCard(
                            surah.value[index],
                          ),
                        );
                      }),
                    )
                  : Container(),
            );
          },
        )
      ],
    );
  }
}
