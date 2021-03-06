import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/routor/routes.dart';
import 'package:flutter_app/service/navigationService.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get_it/get_it.dart';


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
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      builder: (context, child){
        return ScrollConfiguration(behavior: null, child: child);
      },
      navigatorKey: NavigationService().navigatorKey,
      onGenerateRoute: Routes.generateRoute,
    );
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
