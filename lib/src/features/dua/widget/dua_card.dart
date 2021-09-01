import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/util/model/dua.dart';
import '../../utils/sirat_card.dart';
import '../controller/dua_controller.dart';

class DuaCard extends StatelessWidget {
  const DuaCard(this.dua);

  final Dua dua;

  @override
  Widget build(BuildContext context) {
    return SiratCard(
      child: Column(
        children: [
          SvgPicture.asset(
            'assets/images/dua_icon/svg/bismillah.svg',
            color: Theme.of(context).primaryColor,
            width: 0.4.sw,
          ),
          SizedBox(
            height: 16.h,
          ),
          Text(
            dua.aya,
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .headline6!
                .copyWith(fontFamily: 'uthman'),
          ),
          Divider(
            height: 32.h,
          ),
          Row(
            children: [
              Text(
                dua.surah,
                style: Theme.of(context)
                    .textTheme
                    .bodyText2!
                    .copyWith(fontFamily: 'uthman'),
              ),
              SizedBox(
                width: 4.w,
              ),
              Text(
                'Aya: ${dua.ayaNumber}',
                style: Theme.of(context).textTheme.bodyText1,
              ),
              Spacer(),
              GestureDetector(
                onTap: () async {
                  await toggleDuaFavorite(context, dua);
                },
                child: SvgPicture.asset(
                  dua.favorite == 0
                      ? 'assets/images/tasbih_icon/svg/favorite.svg'
                      : 'assets/images/tasbih_icon/svg/favorite_filled.svg',
                  color: Theme.of(context).primaryColor,
                  width: 20.w,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
