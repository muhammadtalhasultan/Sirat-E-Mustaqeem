import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/util/constants.dart';
import '../../../core/util/model/juz.dart';
import '../bloc/selected_juz/selected_juz_bloc.dart';
import '../cubit/quran_cubit.dart';
import '../screen/selected_quran_screen.dart';

class JuzCard extends StatelessWidget {
  const JuzCard(this.juzs, this.index);

  final Juzs juzs;
  final int index;

  @override
  Widget build(BuildContext context) {
    final bool fromNav = BlocProvider.of<QuranCubit>(context).state.fromNav;

    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => BlocProvider(
              create: (context) => SelectedJuzBloc(juzs, index),
              child: BlocProvider(
                create: (context) => QuranCubit(fromNav),
                child: SelectedQuranScreen(
                  surah: false,
                ),
              ),
            ),
          ),
        );
      },
      child: Container(
        padding: EdgeInsets.only(
          left: 16.w,
        ),
        child: Row(
          children: [
            Container(
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  borderRadius: kCardBorderRadius,
                ),
                color: Theme.of(context).primaryColor.withOpacity(
                      0.2,
                    ),
              ),
              width: 48.w,
              height: 48.w,
              alignment: Alignment.center,
              child: FittedBox(
                child: Text(
                  '${index + 1}',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
            ),
            SizedBox(
              width: 16.w,
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(
                  vertical: 16.h,
                ),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Theme.of(context).colorScheme.background,
                      width: 2.sp,
                    ),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      juzs.juzs[index].englishName,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Text(
                      juzs.juzs[index].arabicName,
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontFamily: 'Uthman',
                          ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
