import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../utils/coming_soon_dialog.dart';
import '../model/collection.dart';

class CollectionButton extends StatelessWidget {
  const CollectionButton(this.collection);

  final Collection collection;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (collection.routeName == 'Coming Soon') {
          showDialog(
            context: context,
            builder: (context) => ComingSoonDialog(),
          );
          return;
        }
        if (collection.routeName != '') {
          Navigator.of(context).pushNamed(collection.routeName);
        }
      },
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
              style: Theme.of(context).textTheme.bodyLarge,
              textAlign: TextAlign.center,
            ),
          )
        ],
      ),
    );
  }
}
