import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/sirat_card.dart';

class HadessCard extends StatelessWidget {
  const HadessCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SiratCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Hadees of the Day',
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
                '"A Muslim is a brother of another Muslim, so he should not oppress him, nor should he '
                'hand him over to an oppressor. Whoever has fulfilled the needs of his brother, Allah will '
                'fulfil his needs; whoever has brought his (Muslim) brother out of a discomfort, Allah will bring '
                'him out of the discomforts of the Day of Resurrection, and whoever has screened a Muslim, Allah will '
                'screen him(of his faults) on the Day of Resurrection."',
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 8.h,
              ),
              Text(
                '- Prophet Muhammad',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              SizedBox(
                height: 8.h,
              ),
              Text(
                'Bukhari, Mazalim (Injustices), 3: Muslim, Birr (Piety), 58',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontStyle: FontStyle.italic,
                    ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
