import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sirat_e_mustaqeem/src/core/util/bloc/time_format/time_format_bloc.dart';
import 'package:sirat_e_mustaqeem/src/features/setting/widget/change_format_switch.dart';

import '../../../core/util/bloc/theme/theme_bloc.dart';
import '../../../core/util/constants.dart';
import '../widget/change_theme_switch.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
          padding: kPagePadding,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Change Theme',
                    style: Theme.of(context)
                        .textTheme
                        .headline6!
                        .copyWith(color: Theme.of(context).primaryColor),
                  ),
                  BlocBuilder<ThemeBloc, ThemeState>(
                    builder: (context, state) {
                      return ChangeThemeSwitch(
                          value:
                              state.currentTheme.brightness == Brightness.dark,
                          onChanged: (_) {
                            BlocProvider.of<ThemeBloc>(context).add(
                              ToggleTheme(),
                            );
                          });
                    },
                  ),
                ],
              ),
              Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Change Time Format',
                    style: Theme.of(context)
                        .textTheme
                        .headline6!
                        .copyWith(color: Theme.of(context).primaryColor),
                  ),
                  BlocBuilder<TimeFormatBloc, TimeFormatState>(
                    builder: (context, state) {
                      return ChangeFormatSwitch(
                          value: state.is24,
                          onChanged: (_) {
                            BlocProvider.of<TimeFormatBloc>(context).add(
                              ToggleFormat(),
                            );
                          });
                    },
                  ),
                ],
              )
            ],
          )),
    );
  }
}
