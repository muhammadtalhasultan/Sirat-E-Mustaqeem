import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/sirat_card.dart';
import '../model/contributor.dart';

class ThankyouScreen extends StatelessWidget {
  const ThankyouScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Thank You!',
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 32.h,
            ),
            Expanded(
              child: SiratCard(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Text(
                        'These generous Sirate Mustaqeem contributors '
                        'helped to make this app a reality!',
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      Divider(
                        height: 32.h,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: List.generate(
                                Contributors.firstColumnCount,
                                (index) => Column(
                                  children: [
                                    Text(
                                      Contributors.contributors[index].name,
                                    ),
                                    SizedBox(
                                      height: 8.h,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: List.generate(
                                Contributors.secondColumnCount,
                                (index) => Column(
                                  children: [
                                    Text(
                                      Contributors
                                          .contributors[index +
                                              Contributors.firstColumnCount]
                                          .name,
                                    ),
                                    SizedBox(
                                      height: 8.h,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
