import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../routes/routes.dart';
import '../../../core/util/bloc/database/database_bloc.dart';
import '../../../core/util/constants.dart';

class SplashScaffold extends StatelessWidget {
  const SplashScaffold();

  @override
  Widget build(BuildContext context) {
    return BlocListener<DatabaseBloc, DatabaseState>(
      listener: (context, state) async {
        await Future.delayed(Duration(seconds: 2));
        if (state is DatabaseLoaded) {
          Navigator.of(context).pushReplacementNamed(RouteGenerator.tabScreen);
        } else if (state is DatabaseFailed) {
          Navigator.of(context)
              .pushReplacementNamed(RouteGenerator.databaseError);
        }
      },
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        extendBodyBehindAppBar: true,
        extendBody: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          toolbarHeight: 0,
          systemOverlayStyle: SystemUiOverlayStyle.dark,
        ),
        body: SizedBox(
          height: 1.sh,
          width: 1.sw,
          child: SvgPicture.asset(
            'assets/images/core/svg/splash.svg',
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
