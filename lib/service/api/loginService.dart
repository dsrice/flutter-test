import 'package:dio/dio.dart';
import 'package:flutter_app/const/_filenama.dart';
import 'package:flutter_app/const/_url.dart';
import 'package:flutter_app/model/loginmodel.dart';

import '../firebaseService.dart';
import '../localfileService.dart';


final dio = new Dio();
final url = loginurl;

/*
認証処理
 */
Future<Response> login(String loginid, String pass) async{
  var payload = {
    "loginid": loginid,
    "password": pass
  };


  var data = await dio.post(
    url,
    data: new FormData.fromMap(payload),
    options: Options(
      headers: {
      },
    ),
  ).then((response) {
    return response;
  }).catchError((err){
    return null;
  });

  if(data.statusCode == 200){
    LoginModel model = LoginModel.fromJson(data);
    deleteFile(authfile);
    outputFile(model.token, authfile);
    getToken();
  }
  return data;
}
