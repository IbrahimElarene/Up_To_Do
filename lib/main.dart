import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_1/core/database/services/local_notification_service.dart';
import 'package:to_do_1/core/database/services/service_locator.dart';
import 'package:to_do_1/core/database/sqflite_helper/sqflite_helper.dart';
import 'package:to_do_1/features/auth/presentation/cubit/task_cubit.dart';
import 'package:to_do_1/firebase_options.dart';

import 'app/app.dart';
import 'core/bloc/bloc_observer.dart';
import 'core/database/cache/cache_helper.dart';
import 'core/database/services/push_notification_service.dart';
import 'core/database/services/work_manager_service.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
 await Future.wait([
   PushNotificationsService.init(),
   LocalNotificationService.init(),
 ]);
  Bloc.observer=SimpleBlocObserver();
  // WidgetsFlutterBinding.ensureInitialized();
  await setup();
  await CacheHelper.init();
  // await Future.wait([
  //   LocalNotificationService.init(),
  // WorkManagerService().init(),
  // ]);
  sl<SqfliteHelper>().initDB();
  runApp( BlocProvider(
    create: (context) => TaskCubit()..getTheme()..getTasks(),
    child: MyApp(),));
}
//1. fix bugs
//2. setup notification and workmanger [done]
//3. schedule notification
//4. repeat notification [done]

