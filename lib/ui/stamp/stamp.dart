import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter_app/model/articlemodel.dart';
import 'package:flutter_app/service/api/articleService.dart';
import 'package:flutter_app/view_model/common/common_view_model.dart';

import '../importer.dart';

import 'package:flutter/material.dart';
//アプリがファイルを保存可能な場所を取得するライブラリ
import 'package:path_provider/path_provider.dart';

final _fileName = 'editTextField.txt';

class StampView extends StatefulWidget {
  @override
  _StampViewState createState() => _StampViewState();
}

class _StampViewState extends State<StampView> {
  ArticlesModel _articles = new ArticlesModel();

  @override
  Widget build(BuildContext context) {
    final CommonViewModel data = Provider.of<CommonViewModel>(context);
    return Container(
      padding: const EdgeInsets.all(0.0),
      child: Text("stamp")
    );
  }
}







