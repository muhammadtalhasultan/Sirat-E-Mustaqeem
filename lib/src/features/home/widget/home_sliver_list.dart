import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sirat_e_mustaqeem/src/core/util/constants.dart';
import 'package:sirat_e_mustaqeem/src/features/home/model/collection.dart';

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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Collection',
                  style: Theme.of(context).textTheme.headline6!.copyWith(
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
          ),
        ],
      ),
    );
  }
}

class CollectionButton extends StatelessWidget {
  const CollectionButton(this.collection);

  final Collection collection;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Column(
        children: [
          SvgPicture.asset(
            collection.assetName,
            width: 64.w,
          ),
          SizedBox(
            width: 64.w,
            child: Text(
              collection.title,
              style: Theme.of(context).textTheme.bodyText1,
              textAlign: TextAlign.center,
            ),
          )
        ],
      ),
    );
  }
}
