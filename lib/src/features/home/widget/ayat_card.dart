import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sirat_e_mustaqeem/src/core/util/bloc/surah/surah_bloc.dart';

import '../../../core/util/bloc/quran/quran_bloc.dart';
import '../../utils/sirat_card.dart';

class AyatCard extends StatelessWidget {
  const AyatCard();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuranBloc, QuranState>(
      builder: (context, state) {
        final quran = state.qurans.quranOfTheDay;
        return SiratCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Quran Ayat of the Day',
                style: Theme.of(context).textTheme.headline6!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              Divider(
                height: 32.h,
              ),
              Column(
                children: [
                  Text(
                    quran.arabicText,
                    style: Theme.of(context).textTheme.headline5!.copyWith(
                          fontFamily: 'Uthman',
                        ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  Text(
                    quran.urduTranslation,
                    style: Theme.of(context).textTheme.bodyText2!.copyWith(
                          fontFamily: 'Jameel',
                        ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  BlocBuilder<SurahBloc, SurahState>(
                    builder: (context, surahState) {
                      final surah = surahState.surahs.surahs.firstWhere(
                        (surah) => surah.id == quran.surahId,
                      );
                      return Text(
                        '${surah.id} ${surah.nameEn}, Verse ${quran.ayatNumber}',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.bold,
                            ),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
