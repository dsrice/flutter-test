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

class ArticleView extends StatefulWidget {
  @override
  _ArticleViewState createState() => _ArticleViewState();
}

class _ArticleViewState extends State<ArticleView> {
  ArticlesModel _articles = new ArticlesModel();

  @override
  Widget build(BuildContext context) {
    final CommonViewModel data = Provider.of<CommonViewModel>(context);
    _getArticles();
    return Container(
      padding: const EdgeInsets.all(0.0),
      child: ListView(
        children: _createList(_articles.articles),
      )
    );
  }

  List<Widget>_createList(List<ArticleModel> articles) {
    if(articles == null){
      return [];
    }
    List<Widget> list = [];
    articles.forEach((element) {
      Widget base =  ArticleElement(article: element);
      list.add(base);
    });
    return list;
  }

  Future<void> _getArticles() async{
    await articles().then((value) => _articles = value);
  }
}

class ArticleElement extends StatelessWidget {
  final ArticleModel article;

  ArticleElement({
    this.article
  });

  @override
  Widget build(BuildContext context) {
    return Card(
        child: InkWell(
          child: Container(
            padding: EdgeInsets.all(30.0),
            decoration: new BoxDecoration(
                border: new Border(bottom: BorderSide(width: 1.0, color: Colors.grey))
            ),
            child: Row(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.all(10.0),
                ),
                Text(
                  article.title,
                  style: TextStyle(
                      color:Colors.black,
                      fontSize: 18.0
                  ),
                ),
              ],
            ),
          ),
          onTap: (){
            print("tap");
            print(this.article.article_id);
          }
        )
    );
  }
}






