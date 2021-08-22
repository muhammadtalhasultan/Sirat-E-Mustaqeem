import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sirat_e_mustaqeem/src/core/util/bloc/theme_bloc.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: FloatingActionButton(
          onPressed: () {
            BlocProvider.of<ThemeBloc>(context).add(
              ToggleTheme(),
            );
          },
        ),
      ),
    );
  }
}
