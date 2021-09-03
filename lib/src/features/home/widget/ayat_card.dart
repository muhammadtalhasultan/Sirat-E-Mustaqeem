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
                    '123',
                    style: Theme.of(context).textTheme.headline5!.copyWith(
                          fontFamily: 'Uthman',
                        ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  Text(
                    '123',
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
                      return Text(
                        '123',
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
