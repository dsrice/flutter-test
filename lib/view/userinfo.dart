import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/provider/article.dart';
import 'package:flutter_app/provider/login.dart';
import 'package:flutter_app/provider/stampProvider.dart';
import 'package:flutter_app/provider/userinfo.dart';
import 'package:provider/provider.dart';

class UserInfoView extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final watch = context.watch<UserInfoProvider>();
    print("stamp");
    _getFutureValue();
    return Scaffold(
            appBar: AppBar(
              title: Center(
                child: Text("記事"),
              )
            ),
            body: Container(
                child: GestureDetector(
                  onTap: (){
                    FocusScope.of(context).requestFocus(FocusNode());
                  },
                  child: _fadeInStamp(context),
              ),
            )
          );
  }

  Widget _fadeInStamp(BuildContext context){
    return SingleChildScrollView(
      child: Container(
        child: Text("stamp")
        ),
    );

  }
  Future<String> _getFutureValue() async {
    // 擬似的に通信中を表現するために１秒遅らせる
    await Future.delayed(
      Duration(seconds: 1),
    );
    return Future.value("データの取得に成功しました");
  }


}