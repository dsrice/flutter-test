
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/provider/article.dart';
import 'package:flutter_app/provider/articledetail.dart';
import 'package:flutter_app/provider/login.dart';
import 'package:flutter_app/provider/splashProvider.dart';
import 'package:flutter_app/provider/stampProvider.dart';
import 'package:flutter_app/provider/userinfo.dart';
import 'package:flutter_app/routor/route_path.dart';
import 'package:flutter_app/view/article.dart';
import 'package:flutter_app/view/articledetail.dart';
import 'package:flutter_app/view/login.dart';
import 'package:flutter_app/view/splashView.dart';
import 'package:flutter_app/view/stampView.dart';
import 'package:flutter_app/view/userinfo.dart';
import "package:provider/provider.dart";

class Routes{
  static Route<dynamic> generateRoute(RouteSettings settings){
    switch(settings.name){
      case splashPath:
        return MaterialPageRoute(
          settings: RouteSettings(name: splashPath),
          builder: (context) => ChangeNotifierProvider(
            create: (context) => SplashProvider(context: context),
            child: SplashView()
          )
        );
      case loginPath:
        return MaterialPageRoute(
            settings: RouteSettings(name: stampPath),
            builder: (context) => ChangeNotifierProvider(
                create: (context) => LoginProvider(context: context),
                child: LoginView()
            )
        );
      case stampPath:
        return MaterialPageRoute(
            settings: RouteSettings(name: stampPath),
            builder: (context) => ChangeNotifierProvider(
                create: (context) => StampProvider(context: context),
                child: StampView()
            )
        );
      case articlePath:
        return MaterialPageRoute(
            settings: RouteSettings(name: stampPath),
            builder: (context) => ChangeNotifierProvider(
                create: (context) => ArticleProvider(context: context),
                child: ArticleView()
            )
        );
      case article_detailPath:
        return MaterialPageRoute(
            settings: RouteSettings(name: stampPath),
            builder: (context) => ChangeNotifierProvider(
                create: (context) => ArticleDetailProvider(context: context),
                child: ArticleDetailView()
            )
        );
      case userinfoPath:
        return MaterialPageRoute(
            settings: RouteSettings(name: stampPath),
            builder: (context) => ChangeNotifierProvider(
                create: (context) => UserInfoProvider(context: context),
                child: UserInfoView()
            )
        );

    }
  }

}