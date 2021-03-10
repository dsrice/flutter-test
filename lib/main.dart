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
  }

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
}
