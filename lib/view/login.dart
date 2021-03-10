import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/provider/login.dart';
import 'package:flutter_app/provider/stampProvider.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class LoginView extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    print("login");
    return Scaffold(
      body: Container(
        child: GestureDetector(
          onTap: (){
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: feadInLogin(),
        )
      )
    );
  }
}

class feadInLogin extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _feadInLoginState();
}

class _feadInLoginState extends State<feadInLogin> with SingleTickerProviderStateMixin{
  AnimationController _controller;
  Animation _animation;

  @override
  void initState(){
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2)
    );

    _animation = Tween(
      begin: 0.0,
        end:1.0
    ).animate(_controller);
  }

  @override
  void dispose(){
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context){
    final watch = context.watch<LoginProvider>();
    _controller.forward();
    return FadeTransition(
      opacity: _animation,
      child: Container(
          padding: EdgeInsets.symmetric(vertical: 100.0, horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TextFormField(
              enabled: true,
              maxLength: 50,
              maxLengthEnforced: false,
              obscureText: false,
              maxLines: 1,
              decoration: const InputDecoration(
                icon: FaIcon(FontAwesomeIcons.user),
                labelText: "ログインID"
              ),
              validator: (String value){
                return value.isEmpty ? "必須入力です": null;
              },
              onChanged: watch.changeLogin,
            ),
            TextFormField(
              enabled: true,
              maxLength: 50,
              maxLengthEnforced: false,
              obscureText: true,
              maxLines: 1,
              decoration: const InputDecoration(
                  icon: FaIcon(FontAwesomeIcons.key),
                  labelText: "パスワード"
              ),
              validator: (String value){
                return value.isEmpty ? "必須入力です": null;
              },
              onChanged: watch.changePassword,
            ),
            RaisedButton(
                child: Text("ログイン"),
                color: Colors.blueAccent,
                onPressed: (){
                  this.context.read<LoginProvider>().login();
                }
            )
          ],
        ),
      )
    );
  }

}

