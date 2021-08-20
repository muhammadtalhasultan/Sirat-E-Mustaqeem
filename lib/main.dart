import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

import 'routes/routes.dart';
import 'src/core/util/bloc/theme_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: await getApplicationDocumentsDirectory(),
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ThemeBloc(),
      child: ScreenUtilInit(
          designSize: Size(414, 896),
          builder: () {
            return BlocBuilder<ThemeBloc, ThemeState>(
              builder: (context, state) {
                return MaterialApp(
                  title: 'Material App',
                  debugShowCheckedModeBanner: false,
                  theme: state.currentTheme,
                  initialRoute: RouteGenerator.prayerTimingPage,
                  onGenerateRoute: RouteGenerator.generateRoute,
                );
              },
            );
          }),
    );
  }
}
