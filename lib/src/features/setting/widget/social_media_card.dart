import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/sirat_card.dart';
import '../model/social_media.dart';
import 'social_media_button.dart';

class SocialMediaCard extends StatelessWidget {
  const SocialMediaCard();

  @override
  Widget build(BuildContext context) {
    return SiratCard(
      child: Column(
        children: [
          Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: socialMediaList.length >= 3
                  ? List.generate(
                      3,
                      (index) {
                        return Expanded(
                          child: SocialMediaButton(
                            socialMediaList[index],
                          ),
                        );
                      },
                    )
                  : [
                      ...List.generate(
                        socialMediaList.length,
                        (index) {
                          return Expanded(
                            child: SocialMediaButton(
                              socialMediaList[index],
                            ),
                          );
                        },
                      ),
                      ...List.generate(
                        3 - socialMediaList.length,
                        (index) {
                          return Expanded(
                            child: Container(),
                          );
                        },
                      ),
                    ]),
          if (socialMediaList.length > 3)
            SizedBox(
              height: 16.h,
            ),
          if (socialMediaList.length > 3)
            Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: socialMediaList.length >= 6
                    ? List.generate(
                        3,
                        (index) {
                          return Expanded(
                            child: SocialMediaButton(
                              socialMediaList[index + 3],
                            ),
                          );
                        },
                      )
                    : [
                        ...List.generate(
                          socialMediaList.length - 3,
                          (index) {
                            return Expanded(
                              child: SocialMediaButton(
                                socialMediaList[index + 3],
                              ),
                            );
                          },
                        ),
                        ...List.generate(
                          6 - socialMediaList.length,
                          (index) {
                            return Expanded(
                              child: Container(),
                            );
                          },
                        ),
                      ])
        ],
      ),
    );
  }
}
