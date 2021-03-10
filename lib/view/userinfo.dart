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
    print("userinfo");
    return Scaffold(
            appBar: AppBar(
              leading: Container(),
              title: Text("設定"),
              centerTitle: true,
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
        child: Text("userinfo")
        ),
    );

  }
}