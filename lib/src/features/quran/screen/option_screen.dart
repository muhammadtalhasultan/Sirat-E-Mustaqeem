import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/util/constants.dart';
import '../../utils/custom_switch.dart';
import '../bloc/quran_theme/quran_theme_bloc.dart';

class OptionScreen extends StatelessWidget {
  const OptionScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Quran Styling Option',
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: kPagePadding,
            child: Column(
              children: [
                SizedBox(
                  height: 16.h,
                ),
                ShowTranslationOption(),
                Divider(),
                TranslationMode(),
                Divider(),
                WithArabs(),
                Divider(),
                QuranFontSize(),
                Divider(),
                QuranFontFamily(),
                Divider(),
                TranslationFontSize(),
                Divider(),
                TranslationFontFamily(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ShowTranslationOption extends StatelessWidget {
  const ShowTranslationOption();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Show translation',
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(color: Theme.of(context).primaryColor),
          ),
          BlocBuilder<QuranThemeBloc, QuranThemeState>(
            builder: (context, state) {
              return CustomSwitch(
                  value: state.showTranslation,
                  onChanged: (val) {
                    BlocProvider.of<QuranThemeBloc>(context).add(
                      ShowTranslation(val),
                    );
                  });
            },
          ),
        ],
      ),
    );
  }
}

class TranslationMode extends StatelessWidget {
  const TranslationMode();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Translation mode',
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(color: Theme.of(context).primaryColor),
          ),
          DropdownButtonHideUnderline(
            child: BlocBuilder<QuranThemeBloc, QuranThemeState>(
              builder: (context, state) {
                return DropdownButton(
                  items: List.generate(
                    1,
                    (index) => DropdownMenuItem(
                      child: BlocBuilder<QuranThemeBloc, QuranThemeState>(
                        builder: (context, state) {
                          return Text(
                            state.translationMode,
                          );
                        },
                      ),
                    ),
                  ),
                  onChanged: (value) {},
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

class WithArabs extends StatelessWidget {
  const WithArabs();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'With Arabs',
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(color: Theme.of(context).primaryColor),
          ),
          BlocBuilder<QuranThemeBloc, QuranThemeState>(
            builder: (context, state) {
              return CustomSwitch(
                  value: state.withArabs,
                  onChanged: (val) {
                    BlocProvider.of<QuranThemeBloc>(context).add(
                      ShowWithArab(val),
                    );
                  });
            },
          ),
        ],
      ),
    );
  }
}

class QuranFontSize extends StatelessWidget {
  const QuranFontSize();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              'Quran font size',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Theme.of(context).primaryColor),
            ),
          ),
          GestureDetector(
            onTap: () {
              if (BlocProvider.of<QuranThemeBloc>(context).state.quranFontSize >
                  1)
                BlocProvider.of<QuranThemeBloc>(context)
                    .add(ReduceQuranFontSize());
            },
            child: SvgPicture.asset(
              'assets/images/quran_icon/svg/minus.svg',
              color: Theme.of(context).primaryColor,
              width: 24.w,
            ),
          ),
          SizedBox(
            width: 8.w,
          ),
          BlocBuilder<QuranThemeBloc, QuranThemeState>(
            builder: (context, state) {
              return Text(
                '${state.quranFontSize}',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              );
            },
          ),
          SizedBox(
            width: 8.w,
          ),
          GestureDetector(
            onTap: () {
              BlocProvider.of<QuranThemeBloc>(context).add(AddQuranFontSize());
            },
            child: SvgPicture.asset(
              'assets/images/quran_icon/svg/add.svg',
              color: Theme.of(context).primaryColor,
              width: 24.w,
            ),
          ),
        ],
      ),
    );
  }
}

class QuranFontFamily extends StatelessWidget {
  const QuranFontFamily();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Quran font family',
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(color: Theme.of(context).primaryColor),
          ),
          DropdownButtonHideUnderline(
            child: BlocBuilder<QuranThemeBloc, QuranThemeState>(
              builder: (context, state) {
                return DropdownButton(
                  items: List.generate(
                    1,
                    (index) => DropdownMenuItem(
                      child: BlocBuilder<QuranThemeBloc, QuranThemeState>(
                        builder: (context, state) {
                          return Text(
                            state.quranFontFamily,
                          );
                        },
                      ),
                    ),
                  ),
                  onChanged: (value) {},
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

class TranslationFontSize extends StatelessWidget {
  const TranslationFontSize();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              'Translation font size',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Theme.of(context).primaryColor),
            ),
          ),
          GestureDetector(
            onTap: () {
              if (BlocProvider.of<QuranThemeBloc>(context)
                      .state
                      .translationFontSize >
                  1)
                BlocProvider.of<QuranThemeBloc>(context)
                    .add(ReduceTranslationFontSize());
            },
            child: SvgPicture.asset(
              'assets/images/quran_icon/svg/minus.svg',
              color: Theme.of(context).primaryColor,
              width: 24.w,
            ),
          ),
          SizedBox(
            width: 8.w,
          ),
          BlocBuilder<QuranThemeBloc, QuranThemeState>(
            builder: (context, state) {
              return Text(
                '${state.translationFontSize}',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              );
            },
          ),
          SizedBox(
            width: 8.w,
          ),
          GestureDetector(
            onTap: () {
              BlocProvider.of<QuranThemeBloc>(context)
                  .add(AddTranslationFontSize());
            },
            child: SvgPicture.asset(
              'assets/images/quran_icon/svg/add.svg',
              color: Theme.of(context).primaryColor,
              width: 24.w,
            ),
          ),
        ],
      ),
    );
  }
}

class TranslationFontFamily extends StatelessWidget {
  const TranslationFontFamily();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Translation font family',
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(color: Theme.of(context).primaryColor),
          ),
          DropdownButtonHideUnderline(
            child: BlocBuilder<QuranThemeBloc, QuranThemeState>(
              builder: (context, state) {
                return DropdownButton(
                  items: List.generate(
                    1,
                    (index) => DropdownMenuItem(
                      child: BlocBuilder<QuranThemeBloc, QuranThemeState>(
                        builder: (context, state) {
                          return Text(
                            state.translationFontFamily,
                          );
                        },
                      ),
                    ),
                  ),
                  onChanged: (value) {},
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
