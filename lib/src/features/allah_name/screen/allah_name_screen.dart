import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:sirat_e_mustaqeem/src/core/util/constants.dart';
import 'package:sirat_e_mustaqeem/src/features/allah_name/widget/name_card.dart';

import '../../../core/util/bloc/allah_names/allah_name_bloc.dart';

class AllahNameScreen extends StatelessWidget {
  const AllahNameScreen();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AllahNameBloc, AllahNameState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text('99 Allah Names'),
          ),
          body: SafeArea(
            child: Padding(
              padding: kPagePadding,
              child: ListView.builder(
                itemCount: state.allahNames.allahNames.length,
                itemBuilder: (context, index) => NameCard(
                  state.allahNames.allahNames[index],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
