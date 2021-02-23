import 'package:dio/dio.dart';

final dio = new Dio();
final url = "http://10.0.2.2:8000/v1/auth/token";


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
    print("service");
    print(response.data);
    return response;
  }).catchError((err){
    print("error");
    print(err);
    return null;
  });
  print("test");
  print(data);
  return data;
}
