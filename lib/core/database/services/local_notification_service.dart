// import 'dart:async';
// import 'dart:developer';
//
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:flutter_timezone/flutter_timezone.dart';
// import 'package:timezone/data/latest_all.dart' as tz;
// import 'package:timezone/timezone.dart' as tz;
//
// class LocalNotificationService {
//   static FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//   FlutterLocalNotificationsPlugin();
//   static StreamController<NotificationResponse> streamController =
//   StreamController();
//   static onTap(NotificationResponse notificationResponse) {
//     // log(notificationResponse.id!.toString());
//     // log(notificationResponse.payload!.toString());
//     streamController.add(notificationResponse);
//     // Navigator.push(context, route);
//   }
//
//   static Future init() async {
//     InitializationSettings settings = const InitializationSettings(
//       android: AndroidInitializationSettings('@mipmap/ic_launcher'),
//       iOS: DarwinInitializationSettings(),
//     );
//     flutterLocalNotificationsPlugin.initialize(
//       settings,
//       onDidReceiveNotificationResponse: onTap,
//       onDidReceiveBackgroundNotificationResponse: onTap,
//     );
//   }
//
//   //basic Notification
//   static void showBasicNotification() async {
//     AndroidNotificationDetails android = AndroidNotificationDetails(
//         'id 1', 'basic notification',
//         importance: Importance.max,
//         priority: Priority.high,
//         sound:
//         RawResourceAndroidNotificationSound('sound.wav'.split('.').first));
//     NotificationDetails details = NotificationDetails(
//       android: android,
//     );
//     await flutterLocalNotificationsPlugin.show(
//       0,
//       'Baisc Notification',
//       'body',
//       details,
//       payload: "Payload Data",
//     );
//   }
//
//   //basic Notification2
//   static void showBasicNotification2() async {
//     AndroidNotificationDetails android = AndroidNotificationDetails(
//         'id 3', 'basic notification1',
//         importance: Importance.max,
//         priority: Priority.high,
//         sound:
//         RawResourceAndroidNotificationSound('sound.wav'.split('.').first));
//     NotificationDetails details = NotificationDetails(
//       android: android,
//     );
//     await flutterLocalNotificationsPlugin.show(
//       4,
//       'Basic Notification',
//       'body',
//       details,
//       payload: "Payload Data",
//     );
//   }
//
//   //showRepeatedNotification
//   static void showRepeatedNotification() async {
//     const AndroidNotificationDetails android = AndroidNotificationDetails(
//       'id 2',
//       'repeated notification',
//       importance: Importance.max,
//       priority: Priority.high,
//     );
//     NotificationDetails details = const NotificationDetails(
//       android: android,
//     );
//     await flutterLocalNotificationsPlugin.periodicallyShow(
//         1, 'Reapated Notification',
//         'body', RepeatInterval.daily,
//         details,
//         androidScheduleMode:  AndroidScheduleMode.exactAllowWhileIdle);
//   }
//
//   //showSchduledNotification
//   static void showSchduledNotification() async {
//     const AndroidNotificationDetails android = AndroidNotificationDetails(
//       'schduled notification',
//       'id 3',
//       importance: Importance.max,
//       priority: Priority.high,
//     );
//     NotificationDetails details = const NotificationDetails(
//       android: android,
//     );
//     tz.initializeTimeZones();
//     log(tz.local.name);
//     log("Before ${tz.TZDateTime.now(tz.local).hour}");
//     final String currentTimeZone = await FlutterTimezone.getLocalTimezone();
//     log(currentTimeZone);
//     tz.setLocalLocation(tz.getLocation(currentTimeZone));
//     log(tz.local.name);
//     log("After ${tz.TZDateTime.now(tz.local).hour}");
//     await flutterLocalNotificationsPlugin.zonedSchedule(
//         2,
//         'Schduled Notification',
//         'body',
//         tz.TZDateTime.now(tz.local).add(const Duration(seconds: 10)),
//         details,
//         androidScheduleMode:  AndroidScheduleMode.exactAllowWhileIdle
//     );
//   }
//
//   //showDailySchduledNotification
//   static void showDailySchduledNotification() async {
//     const AndroidNotificationDetails android = AndroidNotificationDetails(
//       'daily schduled notification',
//       'id 4',
//       importance: Importance.max,
//       priority: Priority.high,
//     );
//     NotificationDetails details = const NotificationDetails(
//       android: android,
//     );
//     tz.initializeTimeZones();
//     tz.setLocalLocation(tz.getLocation('Africa/Cairo'));
//     var currentTime = tz.TZDateTime.now(tz.local);
//     log("currentTime.year:${currentTime.year}");
//     log("currentTime.month:${currentTime.month}");
//     log("currentTime.day:${currentTime.day}");
//     log("currentTime.hour:${currentTime.hour}");
//     log("currentTime.minute:${currentTime.minute}");
//     log("currentTime.second:${currentTime.second}");
//     var scheduleTime = tz.TZDateTime(
//       tz.local,
//       currentTime.year,
//       currentTime.month,
//       currentTime.day,
//       21,
//     );
//     log("scheduledTime.year:${scheduleTime.year}");
//     log("scheduledTime.month:${scheduleTime.month}");
//     log("scheduledTime.day:${scheduleTime.day}");
//     log("scheduledTime.hour:${scheduleTime.hour}");
//     log("scheduledTime.minute:${scheduleTime.minute}");
//     log("scheduledTime.second:${scheduleTime.second}");
//     if (scheduleTime.isBefore(currentTime)) {
//       scheduleTime = scheduleTime.add(const Duration(days: 1));
//       log("AfterAddedscheduledTime.year:${scheduleTime.year}");
//       log("AfterAddedscheduledTime.month:${scheduleTime.month}");
//       log("AfterAddedscheduledTime.day:${scheduleTime.day}");
//       log("AfterAddedscheduledTime.hour:${scheduleTime.hour}");
//       log("AfterAddedscheduledTime.minute:${scheduleTime.minute}");
//       log("AfterAddedscheduledTime.second:${scheduleTime.second}");
//       log('Added Duration to scheduled time');
//     }
//     await flutterLocalNotificationsPlugin.zonedSchedule(
//         3,
//         'Write your tasks for tomorrow',
//         'Have a productive day',
//         scheduleTime,
//         details,
//         androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle
//     );
//   }
//
//   static void cancelNotification(int id) async {
//     await flutterLocalNotificationsPlugin.cancel(id);
//   }
// }
//
// //1.setup. [Done]
// //2.Basic Notification. [Done]
// //3.Repeated Notification. [Done]
// //4.Scheduled Notification. [Done]
// //5.Custom Sound. [Done]
// //6.on Tab. [Done]
// //7.Daily Notifications at specific time. [Done]
// //8.Real Example in To Do App.
//
//

// import 'dart:async';
// import 'dart:convert';
//
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:http/http.dart' as http;
//
// class LocalNotificationService {
//   static FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//   FlutterLocalNotificationsPlugin();
//   static StreamController<NotificationResponse> streamController =
//   StreamController();
//   static onTap(NotificationResponse notificationResponse) {
//     // log(notificationResponse.id!.toString());
//     // log(notificationResponse.payload!.toString());
//     streamController.add(notificationResponse);
//     // Navigator.push(context, route);
//   }
//
//   static Future init() async {
//     InitializationSettings settings = const InitializationSettings(
//       android: AndroidInitializationSettings('@mipmap/ic_launcher'),
//       iOS: DarwinInitializationSettings(),
//     );
//     flutterLocalNotificationsPlugin.initialize(
//       settings,
//       onDidReceiveNotificationResponse: onTap,
//       onDidReceiveBackgroundNotificationResponse: onTap,
//     );
//   }
//
//   //basic Notification
//   static void showBasicNotification(RemoteMessage message) async
//   {
//
//     AndroidNotificationDetails android = AndroidNotificationDetails(
//       'id 1',
//       'basic notification',
//       importance: Importance.max,
//       priority: Priority.high,
//     );
//     NotificationDetails details = NotificationDetails(
//       android: android,
//     );
//     await flutterLocalNotificationsPlugin.show(
//       0,
//       message.notification?.title,
//       message.notification?.body,
//       details,
//     );
//   }
// }
//
//
import 'dart:async';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class LocalNotificationService {
  static final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
  FlutterLocalNotificationsPlugin();

  static final StreamController<NotificationResponse> streamController =
  StreamController<NotificationResponse>.broadcast();

  // قناة إشعارات خاصة بالأندرويد
  static const AndroidNotificationChannel channel = AndroidNotificationChannel(
    'high_importance_channel', // id
    'High Importance Notifications', // name
    description: 'This channel is used for important notifications.', // description
    importance: Importance.high,
  );

  // تفعيل الاستماع للنقر على الإشعارات
  static void onTap(NotificationResponse notificationResponse) {
    streamController.add(notificationResponse);
  }

  // تهيئة الإشعارات المحلية مع إعداد القناة
  static Future<void> init() async {
    // إعداد القناة للأندرويد (ضروري للإشعارات عالية الأهمية)
    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);

    const InitializationSettings settings = InitializationSettings(
      android: AndroidInitializationSettings('@mipmap/ic_launcher'),
      iOS: DarwinInitializationSettings(),
    );

    await flutterLocalNotificationsPlugin.initialize(
      settings,
      onDidReceiveNotificationResponse: onTap,
      onDidReceiveBackgroundNotificationResponse: onTap,
    );
  }

  // عرض إشعار بسيط مع دعم عنوان وجسم الرسالة
  static Future<void> showBasicNotification(RemoteMessage message) async {
    final androidDetails = AndroidNotificationDetails(
      channel.id,
      channel.name,
      channelDescription: channel.description,
      importance: channel.importance,
      priority: Priority.high,
      icon: '@mipmap/ic_launcher',
    );

    final notificationDetails = NotificationDetails(
      android: androidDetails,
      iOS: const DarwinNotificationDetails(),
    );

    await flutterLocalNotificationsPlugin.show(
      message.hashCode, // استخدم هاش الرسالة كـ id فريد للإشعار
      message.notification?.title ?? 'Notification',
      message.notification?.body ?? '',
      notificationDetails,
      payload: message.data['payload'] ?? '', // لو فيه بيانات إضافية
    );
  }
}

