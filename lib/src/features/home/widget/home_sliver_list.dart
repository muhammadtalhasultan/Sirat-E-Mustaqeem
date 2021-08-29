import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sirat_e_mustaqeem/src/features/home/widget/ayat_card.dart';
import 'package:sirat_e_mustaqeem/src/features/home/widget/hadees_card.dart';
import 'package:sirat_e_mustaqeem/src/features/home/widget/random_image_card.dart';
import 'package:sirat_e_mustaqeem/src/features/utils/sirat_card.dart';

import 'collection_card.dart';

class HomeSliverList extends StatelessWidget {
  const HomeSliverList();

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate(
        [
          CollectionCard(),
          SizedBox(
            height: 16.h,
          ),
          AyatCard(),
          SizedBox(
            height: 16.h,
          ),
          HadessCard(),
          SizedBox(
            height: 16.h,
          ),
          RandomImageCard(),
          SizedBox(
            height: 112.h,
          ),
        ],
      ),
    );
  }
}
