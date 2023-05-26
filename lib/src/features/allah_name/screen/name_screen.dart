import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/util/constants.dart';
import '../bloc/name_bloc.dart';

class NameScreen extends StatelessWidget {
  const NameScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NameBloc, NameState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(),
          body: SafeArea(
            child: Container(
              width: 1.sw,
              padding: kPagePadding,
              child: Column(
                children: [
                  Spacer(
                    flex: 3,
                  ),
                  Text(
                    state.name.english,
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                    textAlign: TextAlign.center,
                  ),
                  Spacer(
                    flex: 2,
                  ),
                  Text(
                    state.name.arabic,
                    style: Theme.of(context).textTheme.displayLarge!.copyWith(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Uthman',
                        ),
                    textAlign: TextAlign.center,
                  ),
                  Spacer(
                    flex: 2,
                  ),
                  Text(
                    state.name.englishMeaning,
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(),
                    textAlign: TextAlign.center,
                  ),
                  Spacer(
                    flex: 1,
                  ),
                  Text(
                    state.name.urduMeaning,
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                          color: Theme.of(context).primaryColor,
                          fontFamily: 'Jameel',
                        ),
                    textAlign: TextAlign.center,
                  ),
                  Spacer(
                    flex: 1,
                  ),
                  Text(
                    state.name.englishExplanation,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(),
                    textAlign: TextAlign.center,
                  ),
                  Spacer(
                    flex: 3,
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
