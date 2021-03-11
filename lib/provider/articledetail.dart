import 'package:flutter/cupertino.dart';
import 'package:flutter_app/model/article.dart';
import 'package:flutter_app/model/articledetail.dart';
import 'package:flutter_app/service/api/articledetail.dart';

class ArticleDetailProvider with ChangeNotifier{
  final BuildContext context;

  ArticleDetailProvider({
    @required this.context,
  }): assert(context != null);

  ArticleModel _article;

  ArticleModel get article => _article;

  set article(ArticleModel model){
    _article = model;
    notifyListeners();
  }

  ArticleDetailModel _articleDetailModel;

  ArticleDetailModel get articleDetailModel => _articleDetailModel;

  set articleDetailModel(ArticleDetailModel model){
    _articleDetailModel = model;
    notifyListeners();
  }

  bool _loading = true;

  bool get loading => _loading;

  set loading(bool value){
    _loading = value;
    notifyListeners();
  }


  void getArticleDetail(ArticleModel model) async{
    ArticleDetailModel response = await ArticleDetailService().articledetail(model.article_id);
    _articleDetailModel = response;
  }

  void check() async {
    print(_articleDetailModel);
    if(_articleDetailModel != null){
      loading = false;
    }else{
      loading = true;
    }
  }
}