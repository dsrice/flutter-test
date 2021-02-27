import 'package:flutter_app/common/_const.dart';
import 'package:flutter_app/services/localfileService.dart';

import '../bottombar.dart';
import '../importer.dart';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Article extends StatefulWidget{
  @override
  _ArticleState createState() => new _ArticleState();
}

class _ArticleState extends State<Article>{
  // This widget is the root of your application.
  String _out = "";

  void fileload() async {
    setState(() {
      load(authfile).then((String value) {
        setState(() {
          _out = value;
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    fileload();
    return MaterialApp(
        title: 'Flutter Demo',
        home: Scaffold(
            body: Center(
              child: Container(
                color: Colors.blue,
                width: 300,
                height: 300,
                child: Text(_out),
              ),
            ),
            bottomNavigationBar: CommonBottomBar()
        )
    );
  }
}




