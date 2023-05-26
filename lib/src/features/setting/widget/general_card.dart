import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../utils/sirat_card.dart';
import '../model/general_option.dart';
import 'general_option_card.dart';

class GeneralCard extends StatelessWidget {
  const GeneralCard();

  @override
  Widget build(BuildContext context) {
    return SiratCard(
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(
              8.r,
            ),
            child: SvgPicture.asset(
              'assets/images/core/svg/app_logo.svg',
              width: 64.w,
            ),
          ),
          Text(
            'Sirate Mustaqeem',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          SizedBox(
            height: 8.h,
          ),
          Text(
            'an app by',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          SizedBox(
            height: 8.h,
          ),
          Text(
            'Dev Technologies',
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor,
                ),
          ),
          SizedBox(
            height: 8.h,
          ),
          Text(
            'The \'Sirate Mustaqeem\' app is a prodictivity app '
            'to help Muslims creating better habits '
            'and increasing their \'iman\' (faith) '
            ' and \'ibadah\' (acts of worship).',
            textAlign: TextAlign.center,
          ),
          ...List.generate(
            generalOptions.length,
            (index) => Column(
              children: [
                Divider(
                  height: 16.h,
                ),
                GeneralOptionCard(
                  imagePath: generalOptions[index].imagePath,
                  onTap: generalOptions[index].onTap ??
                      () {
                        Navigator.of(context)
                            .pushNamed(generalOptions[index].routeName!);
                      },
                  title: generalOptions[index].title,
                  subtitle: generalOptions[index].subtitle,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
