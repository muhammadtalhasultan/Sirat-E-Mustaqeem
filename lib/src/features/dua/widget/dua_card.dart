import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/util/bloc/dua/dua_bloc.dart';
import '../../../core/util/model/dua.dart';
import '../../bookmark/bloc/category_bloc.dart';
import '../../utils/sirat_card.dart';
import '../controller/dua_controller.dart';

class DuaCard extends StatelessWidget {
  const DuaCard(this.dua, {this.bookmarkScreen = false});

  final Dua dua;
  final bool bookmarkScreen;

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
                .titleLarge!
                .copyWith(fontFamily: 'Uthman'),
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
                    .bodyMedium!
                    .copyWith(fontFamily: 'Jameel'),
              ),
              SizedBox(
                width: 4.w,
              ),
              Text(
                'Aya: ${dua.ayaNumber}',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              Spacer(),
              GestureDetector(
                onTap: () async {
                  await toggleDuaFavorite(context, dua);

                  if (bookmarkScreen) {
                    await Future.delayed(Duration.zero);

                    BlocProvider.of<CategoryBloc>(context).add(
                      UpdateFavoriteItem(
                        duas: BlocProvider.of<DuaBloc>(context).state.duas,
                      ),
                    );
                  }
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
