import 'dart:async';
import 'package:flutter_app/model/articledetailmodel.dart';
import 'package:flutter_app/service/api/articledetailService.dart';
import 'package:flutter_app/view_model/common/common_view_model.dart';
import 'package:flutter_html/flutter_html.dart';

import '../importer.dart';

import 'package:flutter/material.dart';
//アプリがファイルを保存可能な場所を取得するライブラリ
import 'package:path_provider/path_provider.dart';

final _fileName = 'editTextField.txt';

class ArticleDetailView extends StatefulWidget {
  @override
  _ArticleDetailViewState createState() => _ArticleDetailViewState();
}

class _ArticleDetailViewState extends State<ArticleDetailView> {
  ArticleDetailModel _article = new ArticleDetailModel();

  @override
  Widget build(BuildContext context) {
    final CommonViewModel data = Provider.of<CommonViewModel>(context);
    _getArticleDetail();
    return Container(
      padding: const EdgeInsets.all(0.0),
      child: Html(
        data: _article.body != null ? _article.body : "<p>test</p>",
        )
    );
  }

  Future<void> _getArticleDetail() async{
    await articledetail().then((value) => _article = value);
  }
}






