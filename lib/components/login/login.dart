import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter_app/common/_const.dart';
import 'package:flutter_app/components/article/article.dart';
import 'package:flutter_app/services/loginService.dart';
import 'package:flutter_app/services/localfileService.dart';

import '../common.dart';
import '../importer.dart';

import 'package:flutter/material.dart';
//アプリがファイルを保存可能な場所を取得するライブラリ
import 'package:path_provider/path_provider.dart';

final _fileName = 'editTextField.txt';

class LoginApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login',
      home: Scaffold(
        body: Center(
          child: LoginForm(),
        )
      )
    );
  }
}

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();

  String _login_id = "";
  String _pass = "";

  Widget build(BuildContext context){
    return Form(
        key: _formKey,
        child: Container(
          padding: const EdgeInsets.all(50.0),
          child: Column(
            children: <Widget>[
              new TextFormField(
                enabled: true,
                maxLength: 50,
                maxLengthEnforced: false,
                obscureText: false,
                maxLines: 1,
                decoration: const InputDecoration(
                  icon: Icon(Icons.face),
                  hintText: 'ログインIDを入力してください',
                  labelText: 'ログインID',
                ),
                validator: (String value){
                  return value.isEmpty ? "必須入力です" : null;
                },
                onSaved: (String value){
                  this._login_id = value;
                },
              ),
              new TextFormField(
                enabled: true,
                maxLength: 50,
                maxLengthEnforced: false,
                obscureText: true,
                maxLines: 1,
                decoration: const InputDecoration(
                  icon: Icon(Icons.vpn_key),
                  hintText: 'パスワードを入力してください',
                  labelText: 'パスワード',
                ),
                validator: (String value){
                  return value.isEmpty ? "必須入力です" : null;
                },
                onSaved: (String value){
                  this._pass = value;
                },
              ),
              RaisedButton(
                  onPressed: _submission,
                  child: Text("ログイン"),
              )
            ]
        )
      )
    );
  }
  Future<void> _submission() async {
    if (this._formKey.currentState.validate()){
      this._formKey.currentState.save();
      Scaffold.of(context).showSnackBar(SnackBar(content: Text("Processing Date")));
      print(this._login_id);
      print(this._pass);
      var response = await login(this._login_id, this._pass);
      print("login");
      print(response);
      if(response.statusCode == 200){
        print(response.data);
        Map<String, dynamic> user = json.decode(response.toString());
        outputFile(user["token"].toString(), authfile);
      }

      Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => CommonArea(),
          )
      );
    }
  }
}

