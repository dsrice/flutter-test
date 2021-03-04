import 'dart:async';
import 'package:flutter_app/model/articledetailmodel.dart';
import 'package:flutter_app/service/api/articledetailService.dart';
import 'package:flutter_app/view_model/common/common_view_model.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/style.dart';

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
  CommonViewModel _data;

  @override
  Widget build(BuildContext context) {
    final _data = Provider.of<CommonViewModel>(context);
    _getArticleDetail(_data.getArtocleID());
    print(_article);
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<ResultProvider>(
              create: (context) => ResultProvider()
          )
        ],
        child: Consumer<ResultProvider>(builder: (context, model, _) {
            model.setArticle(_article);
            return Container(
                padding: const EdgeInsets.all(0.0),
                child: _article == null ? null : Scaffold(
                    appBar: AppBar(
                      leading: Visibility(
                        visible: _article.prov_id != null,
                        child: IconButton(
                            icon: const FaIcon(FontAwesomeIcons.chevronLeft),
                            color: Colors.black,
                            onPressed: () {
                              _changeArticleDetail(_article.prov_id, model);
                            }
                        ),
                      ),
                      actions: [
                        Visibility(
                            visible: _article.next_id != null,
                            child: IconButton(
                                icon: const FaIcon(FontAwesomeIcons.chevronRight),
                                color: Colors.black,
                                onPressed: (){
                                  print("next");
                                  print(_article);
                                  _changeArticleDetail(_article.next_id, model);
                                }
                            )
                        )
                      ],
                      backgroundColor: Colors.white,
                    ),
                    body: Column(
                      children: _article.title == null ? [] :[
                        Text(_article.title, style:  TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),
                        Html(data: _article.body != null ? _article.body : "<p>test</p>",)
                      ],
                    )
                )
            );
        })
      );
  }

  Future<void> _getArticleDetail(int id) async{
    await articledetail(id).then((value) {
      _article = value;
    });
  }

  Future<void> _changeArticleDetail(int id, ResultProvider model) async{
    await articledetail(id).then((value) {
      _article = value;
    });
    model.changeArticle(_article);
    print("change");
  }
}


class ResultProvider extends ChangeNotifier {
  ArticleDetailModel _article;

  ResultProvider() {
    initValue();
  }

  // 初期化
  void initValue() {
    this._article = new ArticleDetailModel();
  }

  void refresh(){
    initValue();
    print("更新");
    notifyListeners();
  }

  void setArticle(ArticleDetailModel article){
    _article = article;
  }

  void changeArticle(ArticleDetailModel article){
    _article = article;
    notifyListeners();
  }

}




