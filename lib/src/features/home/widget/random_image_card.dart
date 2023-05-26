import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/util/constants.dart';
import '../model/image.dart';

class RandomImageCard extends StatelessWidget {
  const RandomImageCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: kPagePadding,
      decoration: BoxDecoration(
        borderRadius: kCardBorderRadius,
        color: Theme.of(context).colorScheme.background,
      ),
      child: AspectRatio(
        aspectRatio: 1,
        child: Stack(
          children: [
            Container(
              height: double.infinity,
              width: double.infinity,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16.r),
                child: Image.asset(
                  ImageOfTheDay.selectedImagePath,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              height: double.infinity,
              width: double.infinity,
              padding: kCardPadding,
              decoration: BoxDecoration(
                borderRadius: kCardBorderRadius,
                gradient: LinearGradient(
                  colors: [
                    kDarkPlaceholder.withOpacity(0.2),
                    Colors.transparent,
                  ],
                  stops: [0.1, 0.2],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Text(
                'Image of the Day',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      fontWeight: FontWeight.bold,
                      color: kDarkTextColor,
                    ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

/// network image
// CachedNetworkImage(
//                   imageUrl:
//                       'https://theistanbulinsider.com/wp-content/uploads/2020/03/blue-mosque-aerial.jpg',
//                   fit: BoxFit.cover,
//                   fadeOutDuration: Duration.zero,
//                   fadeInCurve: kAnimationCurve,
//                   fadeInDuration: kAnimationDuration,
//                   placeholder: (_, __) => Center(
//                     child: Column(
//                       mainAxisSize: MainAxisSize.min,
//                       children: [
//                         LottieBuilder.asset(
//                           'assets/images/home_icon/lottie_json/ein_mubarak.json',
//                           width: 240.w,
//                         ),
//                         Text(
//                           'Loading Image of the Day',
//                         ),
//                       ],
//                     ),
//                   ),
//                   errorWidget: (_, __, error) => Text(
//                     'Unable to load image at this time. $error',
//                   ),
//                 ),

