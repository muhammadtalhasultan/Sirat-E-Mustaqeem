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
import 'src/core/util/bloc/prayer_timing_bloc/timing_bloc.dart';
import 'src/core/util/bloc/quran/quran_bloc.dart';
import 'src/core/util/bloc/surah/surah_bloc.dart';
import 'src/core/util/bloc/tasbih/tasbih_bloc.dart';
import 'src/core/util/bloc/theme/theme_bloc.dart';
import 'src/core/util/bloc/time_format/time_format_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await NotificationService().init();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: await getApplicationDocumentsDirectory(),
  );
  await SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
    ],
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
          create: (context) => DatabaseBloc(),
        ),
      ],
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
                initialRoute: RouteGenerator.splash,
                onGenerateRoute: RouteGenerator.generateRoute,
              );
            },
          );
        },
      ),
    );
  }
}
