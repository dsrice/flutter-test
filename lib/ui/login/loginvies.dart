import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter_app/service/api/loginService.dart';
import 'package:flutter_app/view_model/common/common_view_model.dart';

import '../importer.dart';

import 'package:flutter/material.dart';
//アプリがファイルを保存可能な場所を取得するライブラリ
import 'package:path_provider/path_provider.dart';

final _fileName = 'editTextField.txt';

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _formKey = GlobalKey<FormState>();
  String _login_id = "";
  String _pass = "";
  CommonViewModel data;

  @override
  Widget build(BuildContext context){
    data = Provider.of<CommonViewModel>(context);

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
                    child: Text("ログイン"),
                    onPressed: _submission,
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
      var response = await login(this._login_id, this._pass);
      if(response.statusCode == 200){
        data.setSelectedIndex(1);
        data.getPageController().animateToPage(2, duration: Duration(milliseconds: 300), curve: Curves.easeIn);
      }
    }
  }

}

