import 'package:dio/dio.dart';
import 'package:flutter_app/const/_filenama.dart';
import 'package:flutter_app/const/_url.dart';
import 'package:flutter_app/model/stamptotal.dart';

import '../localfileService.dart';

class StampService{

  static Future<StampTotalModel> getStampTotal() async{
    final dio = new Dio();
    final url  = stamptotalurl;
    var token = await LocalFileService().load(authfile);
    var data = await dio.get(
      url,
      options: Options(
        headers: {
          "Content-Type": "application/json",
          "Authorization": "JWT $token",
        }
      ),
    ).then((value){
      return value;
    }).catchError((err){
      return null;
    });

    if(data != null && data.statusCode == 200){
      StampTotalModel model = StampTotalModel.fromJson(data);
      return model;
    }
    return null;
  }
}