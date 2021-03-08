import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/provider/login.dart';
import 'package:flutter_app/provider/stampProvider.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:provider/provider.dart';

class LoginView extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final watch = context.watch<LoginProvider>();
    print("stamp");
    _getFutureValue();
    _setIniteMessage();
    _initFirebaseMessageing();
    return Scaffold(
            appBar: AppBar(
              title: Center(
                child: Text("ログイン"),
              )
            ),
            body: Container(
                child: GestureDetector(
                  onTap: (){
                    FocusScope.of(context).requestFocus(FocusNode());
                  },
                  child: _fadeInStamp(context),
              ),
            )
          );
  }

  Widget _fadeInStamp(BuildContext context){
    return SingleChildScrollView(
      child: Container(
        child: Text("stamp")
        ),
    );

  }
  Future<String> _getFutureValue() async {
    // 擬似的に通信中を表現するために１秒遅らせる
    await Future.delayed(
      Duration(seconds: 1),
    );
    return Future.value("データの取得に成功しました");
  }

  Future<void> _setIniteMessage() async {
    await Firebase.initializeApp();
    RemoteMessage initialMessage = await FirebaseMessaging.instance.getInitialMessage();
    FirebaseMessaging messaging = FirebaseMessaging.instance;

    await messaging.setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );

    String token = await messaging.getToken();
    print(token);
  }

  void _initFirebaseMessageing(){


    const AndroidNotificationChannel channel = AndroidNotificationChannel(
      "high_importance_channel",
      "High Importance Notifications",
      "This channel is used for important notifications.",
      importance: Importance.max,
    );

    final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

    flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print("test");
      const AndroidNotificationChannel channel = AndroidNotificationChannel(
        "high_importance_channel",
        "High Importance Notifications",
        "This channel is used for important notifications.",
        importance: Importance.max,
      );
      RemoteNotification notification = message.notification;
      AndroidNotification android = message.notification?.android;

      // If `onMessage` is triggered with a notification, construct our own
      // local notification to show to users using the created channel.
      if (notification != null && android != null) {
        print(notification.hashCode);
        flutterLocalNotificationsPlugin.show(
            notification.hashCode,
            notification.title,
            notification.body,
            NotificationDetails(
              android: AndroidNotificationDetails(
                  "high_importance_channel",
                  "High Importance Notifications",
                  "This channel is used for important notifications.",
                  icon: "ic_stat_name"// other properties...
              ),
            ));
      }
    });
  }

}