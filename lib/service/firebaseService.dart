

import 'package:firebase_messaging/firebase_messaging.dart';

void getToken(){
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

  _firebaseMessaging.requestNotificationPermissions(
    const IosNotificationSettings(sound: true, badge: true, alert: true)
  );

  _firebaseMessaging.getToken().then((String token) {
    print("token: $token");
  });
}
