import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/util/bloc/quran/quran_bloc.dart';
import '../../../core/util/bloc/surah/surah_bloc.dart';
import '../../utils/sirat_card.dart';

class AyatCard extends StatelessWidget {
  const AyatCard();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuranBloc, QuranState>(
      builder: (context, state) {
        return SiratCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Quran Ayat of the Day',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              Divider(
                height: 32.h,
              ),
              Column(
                children: [
                  Text(
                    'رَبِّ اشْرَحْ لِي صَدْرِي وَيَسِّرْ لِي أَمْرِي وَاحْلُلْ عُقْدَةً مِنْ لِسَانِي يَفْقَهُوا قَوْلِي',
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                          fontFamily: 'Uthman',
                        ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  Text(
                    '“My Lord, expand for me my breast [with assurance] and ease for me my task and untie the knot from my tongue that they may understand my speech.”',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  BlocBuilder<SurahBloc, SurahState>(
                    builder: (context, surahState) {
                      return Text(
                        'Surah Taha, Verse 25-28',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
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
