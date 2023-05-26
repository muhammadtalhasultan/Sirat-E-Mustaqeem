import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/util/bloc/juz/juz_bloc.dart';
import '../../../core/util/constants.dart';
import '../bloc/selected_juz/selected_juz_bloc.dart';

class JuzScrollSelection extends StatefulWidget {
  const JuzScrollSelection();

  @override
  State<JuzScrollSelection> createState() => _JuzScrollSelectionState();
}

class _JuzScrollSelectionState extends State<JuzScrollSelection> {
  late final ScrollController controller;
  bool isInit = false;

  @override
  void didChangeDependencies() {
    if (!isInit) {
      controller = ScrollController(
        initialScrollOffset:
            (BlocProvider.of<SelectedJuzBloc>(context).state.index) * 144.w,
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
      child: BlocBuilder<JuzBloc, JuzState>(
        builder: (context, state) {
          return SingleChildScrollView(
            controller: controller,
            scrollDirection: Axis.horizontal,
            reverse: true,
            child: Row(
              children: List.generate(
                state.juzs.juzs.length,
                (index) => Row(
                  children: [
                    SizedBox(
                      width: 8.w,
                    ),
                    GestureDetector(
                      onTap: () {
                        BlocProvider.of<SelectedJuzBloc>(context).add(
                          SelectJuz(
                            index,
                          ),
                        );
                      },
                      child: BlocBuilder<SelectedJuzBloc, SelectedJuzState>(
                        builder: (context, currentJuzState) {
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
                              color: currentJuzState.juz.id ==
                                      state.juzs.juzs[index].id
                                  ? Theme.of(context).scaffoldBackgroundColor
                                  : Theme.of(context)
                                      .colorScheme
                                      .background
                                      .withOpacity(
                                        0.4,
                                      ),
                            ),
                            child: Text(
                              '${state.juzs.juzs[index].englishName}',
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.bodyMedium,
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
