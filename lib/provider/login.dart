import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app/service/api/loginService.dart';
import 'package:rxdart/subjects.dart';

class LoginProvider with ChangeNotifier{
  final BuildContext context;

  LoginProvider({
    @required this.context,
  }): assert(context != null);

  final _loginid = ReplaySubject<String>();
  final _password = ReplaySubject<String>();
  final _transformar = StreamTransformer<String, String>.fromHandlers(
    handleData: ((text, sink) => sink.add(text))
  );

  Stream<String> get loginStream => _loginid.stream.transform(_transformar);
  Stream<String> get passwordStream => _password.stream.transform(_transformar);

  Function(String) get changeLogin => _loginid.sink.add;
  Function(String) get changePassword => _password.sink.add;

  @override
  void dispose(){
    super.dispose();
    _loginid.close();
    _password.close();
  }

  void login() async {
    final loginid = _loginid.values.last;
    final password = _password.values.last;

    Response response = await LoginService.login(loginid, password);
    print(response);
  }
}