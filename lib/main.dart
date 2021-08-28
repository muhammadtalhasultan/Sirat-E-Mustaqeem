import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

import 'routes/routes.dart';
import 'src/core/notification/notification_service.dart';
import 'src/core/util/bloc/prayer_timing_bloc/timing_bloc.dart';
import 'src/core/util/bloc/theme/theme_bloc.dart';
import 'src/core/util/bloc/time_format/time_format_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await NotificationService().init();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: await getApplicationDocumentsDirectory(),
  );
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ThemeBloc(),
      child: BlocProvider(
        create: (context) => TimeFormatBloc(),
        child: BlocProvider(
          create: (context) => TimingBloc(),
          child: ScreenUtilInit(
              designSize: Size(414, 896),
              builder: () {
                return BlocBuilder<ThemeBloc, ThemeState>(
                  builder: (context, state) {
                    return MaterialApp(
                      title: 'Material App',
                      debugShowCheckedModeBanner: false,
                      color: Colors.white,
                      theme: state.currentTheme,
                      initialRoute: RouteGenerator.tabScreen,
                      onGenerateRoute: RouteGenerator.generateRoute,
                    );
                  },
                );
              }),
        ),
      ),
    );
  }
}
