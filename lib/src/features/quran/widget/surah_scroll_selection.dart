import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/util/bloc/surah/surah_bloc.dart';
import '../../../core/util/constants.dart';
import '../bloc/selected_surah/selected_surah_bloc.dart';

class SurahScrollSelection extends StatefulWidget {
  const SurahScrollSelection();

  @override
  State<SurahScrollSelection> createState() => _SurahScrollSelectionState();
}

class _SurahScrollSelectionState extends State<SurahScrollSelection> {
  late final ScrollController controller;
  bool isInit = false;

  @override
  void didChangeDependencies() {
    if (!isInit) {
      controller = ScrollController(
        initialScrollOffset:
            (BlocProvider.of<SelectedSurahBloc>(context).state.index) * 144.w,
      );
      isInit = true;
    }

    super.didChangeDependencies();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56.h,
      padding: EdgeInsets.only(
        right: 16.w,
      ),
      child: BlocBuilder<SurahBloc, SurahState>(
        builder: (context, state) {
          return SingleChildScrollView(
            controller: controller,
            scrollDirection: Axis.horizontal,
            reverse: true,
            child: Row(
              children: List.generate(
                state.surahs.surahs.length,
                (index) => Row(
                  children: [
                    SizedBox(
                      width: 8.w,
                    ),
                    GestureDetector(
                      onTap: () {
                        BlocProvider.of<SelectedSurahBloc>(context).add(
                          SelectSurah(
                            index,
                          ),
                        );
                      },
                      child: BlocBuilder<SelectedSurahBloc, SelectedSurahState>(
                        builder: (context, currentSurahState) {
                          return AnimatedContainer(
                            duration: kAnimationDuration,
                            curve: kAnimationCurve,
                            padding: EdgeInsets.symmetric(
                              horizontal: 16.w,
                              vertical: 8.h,
                            ),
                            width: 136.w,
                            decoration: ShapeDecoration(
                              shape: const StadiumBorder(),
                              color: currentSurahState.surah.id ==
                                      state.surahs.surahs[index].id
                                  ? Theme.of(context).scaffoldBackgroundColor
                                  : Theme.of(context)
                                      .colorScheme
                                      .background
                                      .withOpacity(
                                        0.4,
                                      ),
                            ),
                            child: FittedBox(
                              child: Text(
                                  '${index + 1}. ${state.surahs.surahs[index].nameEn}'),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ).reversed.toList(),
            ),
          );
        },
      ),
    );
  }
}
