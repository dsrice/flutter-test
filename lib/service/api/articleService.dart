import 'package:dio/dio.dart';
import 'package:flutter_app/const/_filenama.dart';
import 'package:flutter_app/const/_url.dart';
import 'package:flutter_app/model/articlemodel.dart';
import 'package:flutter_app/model/loginmodel.dart';

import '../localfileService.dart';


final dio = new Dio();
final url = articleurl;


/*
記事一覧取得処理
 */
Future<Response> articles() async{
  var token = load(authfile);
  print(token);
  var data = await dio.get(
    url,
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

  if(data.statusCode == 200){
    ArticlesModel model = ArticlesModel.fromJson(data);
    print(model);
  }

  return data;
}
