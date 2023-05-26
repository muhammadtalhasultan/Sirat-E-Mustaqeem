import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/sirat_card.dart';
import '../model/collection.dart';
import 'collection_button.dart';

class CollectionCard extends StatelessWidget {
  const CollectionCard();

  @override
  Widget build(BuildContext context) {
    return SiratCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Collection',
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          SizedBox(
            height: 16.h,
          ),
          Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: collections.length >= 4
                  ? List.generate(
                      4,
                      (index) {
                        return CollectionButton(
                          collections[index],
                        );
                      },
                    )
                  : [
                      ...List.generate(
                        collections.length,
                        (index) {
                          return CollectionButton(
                            collections[index],
                          );
                        },
                      ),
                      ...List.generate(
                        4 - collections.length,
                        (index) {
                          return SizedBox(
                            width: 64.w,
                          );
                        },
                      ),
                    ]),
          if (collections.length > 4)
            SizedBox(
              height: 16.h,
            ),
          if (collections.length > 4)
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: collections.length >= 8
                    ? List.generate(
                        4,
                        (index) {
                          return CollectionButton(
                            collections[index + 4],
                          );
                        },
                      )
                    : [
                        ...List.generate(
                          collections.length - 4,
                          (index) {
                            return CollectionButton(
                              collections[index + 4],
                            );
                          },
                        ),
                        ...List.generate(
                          8 - collections.length,
                          (index) {
                            return SizedBox(
                              width: 64.w,
                            );
                          },
                        ),
                      ])
        ],
      ),
    );
  }
}
