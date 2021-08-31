import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/util/bloc/tasbih/tasbih_bloc.dart';
import '../widget/tasbih_card.dart';

class TasbihScreen extends StatelessWidget {
  const TasbihScreen();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasbihBloc, TasbihState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Tasbih'),
          ),
          body: SafeArea(
            child: ListView.builder(
                itemCount: state.tasbihs.tasbihs.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: index == 0
                        ? EdgeInsets.only(
                            top: 16.h,
                            bottom: 8.0.h,
                          )
                        : EdgeInsets.symmetric(
                            vertical: 8.0.h,
                          ),
                    child: TasbihCard(
                      state.tasbihs.tasbihs[index],
                      index + 1,
                    ),
                  );
                }),
          ),
        );
      },
    );
  }
}
