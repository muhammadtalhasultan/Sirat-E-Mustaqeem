import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/sirat_card.dart';

class AyatCard extends StatelessWidget {
  const AyatCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SiratCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
                'Some Arab text',
                style: Theme.of(context).textTheme.headline5!,
              ),
              SizedBox(
                height: 4.h,
              ),
              Text(
                'And Allah knows what you conceal and what you declare.',
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 8.h,
              ),
              Text('Surah 16 An-Nahl, Verse 19',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold,
                      )),
            ],
          ),
        ],
      ),
    );
  }
}
