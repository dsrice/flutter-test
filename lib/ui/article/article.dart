import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter_app/service/api/articleService.dart';
import 'package:flutter_app/view_model/common/common_view_model.dart';

import '../importer.dart';

import 'package:flutter/material.dart';
//アプリがファイルを保存可能な場所を取得するライブラリ
import 'package:path_provider/path_provider.dart';

final _fileName = 'editTextField.txt';

class ArticleView extends StatefulWidget {
  @override
  _ArticleViewState createState() => _ArticleViewState();
}

class _ArticleViewState extends State<ArticleView> {

  @override
  Widget build(BuildContext context){
    final CommonViewModel data = Provider.of<CommonViewModel>(context);
    articles();
    return Form(
        child: Container(
            padding: const EdgeInsets.all(50.0),
            child: Column(
              children: [
                Text("test")
              ],
            )
        )
    );
  }
}

