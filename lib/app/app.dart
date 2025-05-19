import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:to_do_1/core/untils/app_assets.dart';
import 'package:to_do_1/core/untils/app_colors.dart';
import 'package:to_do_1/core/untils/app_strings.dart';
import 'package:to_do_1/features/auth/presentation/cubit/task_cubit.dart';
import 'package:to_do_1/features/auth/presentation/cubit/task_state.dart';

import '../core/theme/theme.dart';
import '../features/auth/presentation/screens/splach_screen/splach_screen.dart';
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 812),
      builder: (context, child) {
        return BlocBuilder<TaskCubit,TaskState>(builder: (context, state) {
          return MaterialApp(
            //title: 'To-Do App',
            title: AppStrings.appName,
            debugShowCheckedModeBanner: false,
            theme: getAppTheme(),
            darkTheme: getAppDarkTheme(),
            themeMode: BlocProvider.of<TaskCubit>(context).isDark?ThemeMode.dark:ThemeMode.light,
            home: SplachScreen(),
          );
        },);
      },

    );
  }
}
