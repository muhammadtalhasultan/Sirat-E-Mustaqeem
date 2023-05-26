import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/util/bloc/quran/quran_bloc.dart';
import '../../../core/util/constants.dart';
import '../../../core/util/model/quran.dart';
import '../../bookmark/bloc/category_bloc.dart';
import '../bloc/quran_theme/quran_theme_bloc.dart';
import '../controller/quran_controller.dart';

class QuranCard extends StatelessWidget {
  const QuranCard(this.quran, {this.bookmarkScreen = false});

  final Quran quran;
  final bool bookmarkScreen;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuranThemeBloc, QuranThemeState>(
      builder: (context, state) {
        return Container(
          padding: kPagePadding,
          child: Row(
            children: [
              GestureDetector(
                onTap: () async {
                  await toggleQuranFavorite(context, quran);

                  if (bookmarkScreen) {
                    await Future.delayed(Duration.zero);

                    BlocProvider.of<CategoryBloc>(context).add(
                      UpdateFavoriteItem(
                        qurans:
                            BlocProvider.of<QuranBloc>(context).state.qurans,
                      ),
                    );
                  }
                },
                child: SvgPicture.asset(
                  quran.favorite == 0
                      ? 'assets/images/navigation_icon/svg/bookmark_nfill.svg'
                      : 'assets/images/navigation_icon/svg/bookmark_fill.svg',
                  color: Theme.of(context).primaryColor,
                  width: 24.w,
                ),
              ),
              SizedBox(
                width: 16.w,
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(
                    vertical: 16.h,
                  ),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Theme.of(context).colorScheme.background,
                        width: 2.sp,
                      ),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        state.withArabs
                            ? '${quran.arabicText}'
                            : '${quran.withoutAerab}',
                        textAlign: TextAlign.end,
                        style:
                            Theme.of(context).textTheme.displaySmall!.copyWith(
                                  fontFamily: 'Uthman',
                                  fontSize: state.quranFontSize,
                                ),
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      if (state.showTranslation)
                        Text(
                          '${quran.urduTranslation}',
                          textAlign: TextAlign.end,
                          style:
                              Theme.of(context).textTheme.titleLarge!.copyWith(
                                    fontFamily: 'Jameel',
                                    fontSize: state.translationFontSize,
                                  ),
                        ),
                      SizedBox(
                        height: 8.h,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
