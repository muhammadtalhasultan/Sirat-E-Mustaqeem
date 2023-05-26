import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/util/constants.dart';
import '../../../core/util/model/surah.dart';
import '../bloc/selected_surah/selected_surah_bloc.dart';
import '../cubit/quran_cubit.dart';
import '../screen/selected_quran_screen.dart';

class SurahCard extends StatelessWidget {
  const SurahCard(this.surahs, this.index);

  final Surahs surahs;
  final int index;

  @override
  Widget build(BuildContext context) {
    final bool fromNav = BlocProvider.of<QuranCubit>(context).state.fromNav;

    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => BlocProvider(
              create: (context) => SelectedSurahBloc(surahs, index),
              child: BlocProvider(
                create: (context) => QuranCubit(fromNav),
                child: SelectedQuranScreen(surah: true),
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
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            surahs.surahs[index].nameEn,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          Text(
                            '${surahs.surahs[index].place} - ${surahs.surahs[index].ayats} ayat',
                            style: Theme.of(context).textTheme.bodyLarge,
                          )
                        ],
                      ),
                    ),
                    Text(
                      surahs.surahs[index].nameAr,
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            fontFamily: 'Uthman',
                          ),
                    ),
                    SizedBox(
                      width: 16.w,
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
