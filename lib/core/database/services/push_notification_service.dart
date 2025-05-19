import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:to_do_1/core/database/services/local_notification_service.dart';

class PushNotificationsService{
  static FirebaseMessaging messaging =FirebaseMessaging.instance;

  static Future init()async{
    await messaging.requestPermission();
    String? token = await messaging.getToken();
    log(token??'null');
    FirebaseMessaging.onBackgroundMessage(handlebackgroundMessage);
    handleForgroundMessage();
  }
  static Future<void> handlebackgroundMessage(RemoteMessage message)async{
    await Firebase.initializeApp();
    log(message.notification?.title??'null');
  }
  static void handleForgroundMessage(){
    //foreground
    FirebaseMessaging.onMessage.listen((RemoteMessage message){
      LocalNotificationService.showBasicNotification(message);
    });
  }
}