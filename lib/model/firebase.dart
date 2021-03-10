
import 'package:flutter/cupertino.dart';

class FirebaseMessage{
  final String title;
  final String body;

  FirebaseMessage({
    @required this.title,
    @required this.body,
  }): assert(title != null),
      assert(body != null);

  FirebaseMessage.fromAndroidJson(Map<String, dynamic> json)
    : title = json["data"]["title"],
      body = json["data"]["body"];

}