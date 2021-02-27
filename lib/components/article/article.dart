import 'dart:async';
import 'dart:io';
import '../importer.dart';

import 'package:flutter/material.dart';
//アプリがファイルを保存可能な場所を取得するライブラリ
import 'package:path_provider/path_provider.dart';

final _fileName = 'editTextField.txt';

class Article extends StatefulWidget{
  @override
  _ArticleState createState() => new _ArticleState();
}

class _ArticleState extends State<Article>{
  // This widget is the root of your application.
  String _out = "";

  void fileload() async {
    setState(() {
      load().then((String value) {
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
            )
        )
    );
  }
}

//テキストファイルを保存するパスを取得する
Future<File> getFilePath() async {
  final directory = await getApplicationSupportDirectory();
  return File(directory.path + '/' + _fileName);
}

//テキストファイルの読み込み
Future<String> load() async {
  final file = await getFilePath();
  return file.readAsString();
}



