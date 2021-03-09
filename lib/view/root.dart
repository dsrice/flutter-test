import 'dart:convert';
import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/model/firebase.dart';
import 'package:flutter_app/provider/article.dart';
import 'package:flutter_app/provider/login.dart';
import 'package:flutter_app/provider/stampProvider.dart';
import 'package:flutter_app/routor/route_path.dart';
import 'package:flutter_app/service/navigationService.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:provider/provider.dart';

class RootView extends StatefulWidget {
  @override
  _RootViewState createState() => _RootViewState();
}

class _RootViewState extends State<RootView>{
  @override
  void initState(){
    super.initState();
  }
  
  @override
  Widget build(BuildContext context){
    return Container(
      color: Colors.white
    );
  }

}