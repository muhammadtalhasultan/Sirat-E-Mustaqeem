import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

import 'routes/routes.dart';
import 'src/core/notification/notification_service.dart';
import 'src/core/util/bloc/allah_names/allah_name_bloc.dart';
import 'src/core/util/bloc/database/database_bloc.dart';
import 'src/core/util/bloc/dua/dua_bloc.dart';
import 'src/core/util/bloc/juz/juz_bloc.dart';
import 'src/core/util/bloc/location/location_bloc.dart';
import 'src/core/util/bloc/notification/notification_bloc.dart';
import 'src/core/util/bloc/prayer_timing_bloc/timing_bloc.dart';
import 'src/core/util/bloc/quran/quran_bloc.dart';
import 'src/core/util/bloc/surah/surah_bloc.dart';
import 'src/core/util/bloc/tasbih/tasbih_bloc.dart';
import 'src/core/util/bloc/theme/theme_bloc.dart';
import 'src/core/util/bloc/time_format/time_format_bloc.dart';
import 'src/features/bottom_tab/bloc/tab/tab_bloc.dart';
import 'src/features/quran/bloc/quran_theme/quran_theme_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await NotificationService().init();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: await getApplicationDocumentsDirectory(),
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ThemeBloc(),
        ),
        BlocProvider(
          create: (context) => TimeFormatBloc(),
        ),
        BlocProvider(
          create: (context) => NotificationBloc(),
        ),
        BlocProvider(
          create: (context) => QuranThemeBloc(),
        ),
        BlocProvider(
          create: (context) => TimingBloc(),
        ),
        BlocProvider(
          create: (context) => AllahNameBloc(),
        ),
        BlocProvider(
          create: (context) => DuaBloc(),
        ),
        BlocProvider(
          create: (context) => QuranBloc(),
        ),
        BlocProvider(
          create: (context) => SurahBloc(),
        ),
        BlocProvider(
          create: (context) => TasbihBloc(),
        ),
        BlocProvider(
          create: (context) => JuzBloc(),
        ),
        BlocProvider(
          create: (context) => DatabaseBloc(),
        ),
        BlocProvider(
          create: (context) => TabBloc(),
        ),
        BlocProvider(
          create: (context) => LocationBloc(),
        ),
      ],
      child: FutureBuilder<void>(
          future: SystemChrome.setPreferredOrientations(
            [
              DeviceOrientation.portraitUp,
            ],
          ),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done)
              return ScreenUtilInit(
                designSize: Size(414, 896),
                builder: (context, child) {
                  return BlocBuilder<ThemeBloc, ThemeState>(
                    builder: (context, state) {
                      return MaterialApp(
                        title: 'Sirate Mustaqeem',
                        debugShowCheckedModeBanner: false,
                        color: Colors.white,
                        theme: state.currentTheme,
                        initialRoute: RouteGenerator.splash,
                        onGenerateRoute: RouteGenerator.generateRoute,
                      );
                    },
                  );
                },
              );
            return MaterialApp(
              title: 'Sirate Mustaqeem',
              debugShowCheckedModeBanner: false,
              color: Colors.white,
              home: Container(),
            );
          }),
    );
  }
}
