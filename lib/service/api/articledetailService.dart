import 'package:dio/dio.dart';
import 'package:flutter_app/const/_filenama.dart';
import 'package:flutter_app/const/_url.dart';
import 'package:flutter_app/model/articledetailmodel.dart';

import '../localfileService.dart';


final dio = new Dio();
final url = articledetailurl;

/*
記事一覧取得処理
 */
Future<ArticleDetailModel> articledetail(int id) async{
  var token = load(authfile);
  print(token);
  var data = await dio.get(
    url,
    queryParameters: {"article_id": id},
    options: Options(
      headers: {
        "Content-Type": "application/json",
        "Authorization": "JWT $token",
      },    ),
  ).then((response) {
    print(response);
    return response;
  }).catchError((err){
    return null;
  });

  print(data);
  if(data != null && data.statusCode == 200){
    ArticleDetailModel model = ArticleDetailModel.fromJson(data);
    print(model);
    return model;
  }

  return null;
}
