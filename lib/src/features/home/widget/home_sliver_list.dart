import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/util/constants.dart';
import 'collection_card.dart';

class HomeSliverList extends StatelessWidget {
  const HomeSliverList();

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate(
        [
          Container(
            width: double.infinity,
            margin: kPagePadding,
            padding: kCardPadding,
            decoration: BoxDecoration(
              borderRadius: kCardBorderRadius,
              color: Theme.of(context).colorScheme.background,
            ),
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
