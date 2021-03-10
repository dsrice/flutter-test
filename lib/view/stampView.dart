import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/provider/stampProvider.dart';
import 'package:provider/provider.dart';

class StampView extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final watch = context.watch<StampProvider>();
    print("stamp");
    return Scaffold(
            appBar: AppBar(
              leading: Container(),
              title: const Text("スタンプ状況"),
              centerTitle: true,
            ),
            body: Container(
              child: Text("スタンプ"),
              ),
            );
  }

}