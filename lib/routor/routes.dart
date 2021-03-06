
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/provider/stampProvider.dart';
import 'package:flutter_app/routor/route_path.dart';
import 'package:flutter_app/view/stampView.dart';
import "package:provider/provider.dart";

class Routes{
  static Route<dynamic> generateRoute(RouteSettings settings){
    switch(settings.name){
      case splashPath:
        return MaterialPageRoute(
          settings: RouteSettings(name: splashPath),
          builder: (context) => ChangeNotifierProvider(
            create: (context) => StampProvider(context: context),
            child: StampView()
          )
        );

    }
  }

}