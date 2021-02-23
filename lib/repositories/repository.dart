import 'package:chopper/chopper.dart';
import 'package:flutter_app/services/loginService.dart';

import 'chopper_client_creator.dart';

class Repository {
  final loginService service = loginService.create(ChopperClientCreator.create());

  Future<Response> getTodo() async {
    Map<String, dynamic> request = {"loginid": "test", "password": "test"};
    final Response<dynamic> response = await service.getTodo(request);
    print(response);
    if(response.isSuccessful){
      print("OK");
    }
  }
}