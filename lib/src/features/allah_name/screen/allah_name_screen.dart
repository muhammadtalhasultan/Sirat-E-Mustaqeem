import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/util/bloc/allah_names/allah_name_bloc.dart';

class AllahNameScreen extends StatelessWidget {
  const AllahNameScreen();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AllahNameBloc, AllahNameState>(
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
              child: Column(
            children: [
              Text(state.allahNames.allahNames[0].englishExplanation),
            ],
          )),
        );
      },
    );
  }
}
