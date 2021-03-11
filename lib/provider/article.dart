import 'package:flutter/cupertino.dart';
import 'package:flutter_app/model/article.dart';
import 'package:flutter_app/service/api/article.dart';

class ArticleProvider with ChangeNotifier{
  final BuildContext context;

  ArticleProvider({
    @required this.context,
  }): assert(context != null);

  ArticlesModel _articleModel;

  ArticlesModel get articleModel => _articleModel;

  bool _loading = true;

  bool get loading => _loading;

  set loading(bool value){
    _loading = value;
    notifyListeners();
  }

  void getArticles() async{
    ArticlesModel response = await ArticleService.articles();
    this._articleModel = response;
  }

  void check() async {
    print(_articleModel);
    if(_articleModel != null){
      loading = false;
    }else{
      loading = true;
    }
  }
}