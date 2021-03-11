import 'package:dio/dio.dart';
import 'package:flutter_app/const/_filenama.dart';
import 'package:flutter_app/const/_url.dart';
import 'package:flutter_app/model/article.dart';

import '../localfileService.dart';

class ArticleService {
  /*
  記事一覧取得処理
   */
  static Future<ArticlesModel> articles() async {
    final dio = new Dio();
    final url = articleurl;
    var token = await LocalFileService().load(authfile);
    var data = await dio.get(
      url,
      options: Options(
        headers: {
          "Content-Type": "application/json",
          "Authorization": "JWT $token",
        },),
    ).then((response) {
      print(response);
      return response;
    }).catchError((err) {
      return null;
    });

    if (data.statusCode == 200) {
      ArticlesModel model = ArticlesModel.fromJson(data);
      print(model);
      return model;
    }

    return null;
  }
}