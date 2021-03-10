import 'package:dio/dio.dart';
import 'package:flutter_app/const/_filenama.dart';
import 'package:flutter_app/const/_url.dart';
import 'package:flutter_app/model/login.dart';

import '../localfileService.dart';

class LoginService{

  static Future<Response> login(String loginid, String password) async{
    final dio = new Dio();
    final url = loginurl;
    var payload = {
      "loginid": loginid,
      "password": password
    };

    var data = await dio.post(
      url,
      data: new FormData.fromMap(payload),
      options: Options(
        headers: {},
      ),
    ).then((response){
      return response;
    }).catchError((err){
      return null;
    });

    if(data != null && data.statusCode == 200){
      LoginModel model = LoginModel.fromJson(data);
      LocalFileService local = LocalFileService();
      local.deleteFile(authfile);
      local.outputFile(model.token, authfile);
    }
    return data;
  }

}