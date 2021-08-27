import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sirat_e_mustaqeem/src/features/utils/sirat_card.dart';

import 'collection_card.dart';

class HomeSliverList extends StatelessWidget {
  const HomeSliverList();

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate(
        [
          SiratCard(
            child: CollectionCard(),
          ),
          Container(
            height: 2.sh,
          ),
        ],
      ),
    );
  }
}
