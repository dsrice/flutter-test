import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/routor/routes.dart';
import 'package:flutter_app/service/navigationService.dart';
import 'package:flutter_app/widget/scroll_behavior.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


void main() {
  runApp(App());
}


class App extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AppState();

}

class _AppState extends State<App>{

  @override
  void initState() {
    super.initState();
    _setIniteMessage();
    _initFirebaseMessageing();
  }
/*
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      builder: (context, child){
        return ScrollConfiguration(
            behavior: AppScrollBehavior(),
            child: child
        );
      },
      navigatorKey: NavigationService.instance.navigatorKey,
      onGenerateRoute: Routes.generateRoute,
    );
  }
*/

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home:Scaffold(
      body: Container(
        child: Center(
          child: Text("main"),
        ),
      ),
    )
    );
  }

  Future<void> _setIniteMessage() async {
    await Firebase.initializeApp();
    RemoteMessage initialMessage = await FirebaseMessaging.instance.getInitialMessage();
    FirebaseMessaging messaging = FirebaseMessaging.instance;

    await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );
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
        "base_channel_id",
        "base_channel_name",
        "base_channel_descriotion",
        importance: Importance.max,
    );

    final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

    flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print("test");
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
                  "base_channel_id",
                  "base_channel_name",
                  "base_channel_descriotion",
                icon: "ic_stat_name"// other properties...
              ),
            ));
      }
    });
  }
}
