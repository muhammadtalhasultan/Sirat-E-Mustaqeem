import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'ayat_card.dart';
import 'collection_card.dart';
import 'hadees_card.dart';
import 'random_image_card.dart';

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
