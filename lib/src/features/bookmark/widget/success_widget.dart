import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/util/constants.dart';
import '../../dua/widget/dua_card.dart';
import '../../quran/widget/quran_card.dart';
import '../../tasbih/widget/tasbih_card.dart';
import '../bloc/category_bloc.dart';
import 'category_title.dart';

class SuccessWidget extends StatelessWidget {
  const SuccessWidget();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryBloc, CategoryState>(
      builder: (context, state) {
        state as CategoryDone;

        return SafeArea(
          child: SizedBox(
            width: 1.sw,
            height: 1.sh,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (state.qurans.isNotEmpty)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 8.h,
                        ),
                        CategoryTitle(
                          'Quran',
                          'assets/images/collection_icon/svg/quran.svg',
                        ),
                        SizedBox(
                          height: 8.h,
                        ),
                        ...List.generate(
                          state.qurans.length,
                          (index) => Column(
                            children: [
                              Container(
                                width: double.infinity,
                                margin: kPagePadding,
                                decoration: BoxDecoration(
                                  borderRadius: kCardBorderRadius,
                                  color:
                                      Theme.of(context).colorScheme.background,
                                ),
                                child: QuranCard(
                                  state.qurans[index],
                                  bookmarkScreen: true,
                                ),
                              ),
                              SizedBox(
                                height: 8.h,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  if (state.duas.isNotEmpty)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 8.h,
                        ),
                        CategoryTitle(
                          'Dua',
                          'assets/images/collection_icon/svg/duas.svg',
                        ),
                        SizedBox(
                          height: 8.h,
                        ),
                        ...List.generate(
                          state.duas.length,
                          (index) => Column(
                            children: [
                              DuaCard(
                                state.duas[index],
                                bookmarkScreen: true,
                              ),
                              SizedBox(
                                height: 8.h,
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  if (state.tasbihs.isNotEmpty)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 8.h,
                        ),
                        CategoryTitle(
                          'Tasbih',
                          'assets/images/collection_icon/svg/tasbih.svg',
                        ),
                        SizedBox(
                          height: 8.h,
                        ),
                        ...List.generate(
                          state.tasbihs.length,
                          (index) => Column(
                            children: [
                              TasbihCard(
                                state.tasbihs[index],
                                index + 1,
                                bookmarkScreen: true,
                              ),
                              SizedBox(
                                height: 8.h,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
