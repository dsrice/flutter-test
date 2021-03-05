import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter_app/model/articlemodel.dart';
import 'package:flutter_app/model/stamptotalmodel.dart';
import 'package:flutter_app/service/api/articleService.dart';
import 'package:flutter_app/service/api/stamptotalService.dart';
import 'package:flutter_app/view_model/common/common_view_model.dart';

import '../importer.dart';

import 'package:flutter/material.dart';
//アプリがファイルを保存可能な場所を取得するライブラリ
import 'package:path_provider/path_provider.dart';

final _fileName = 'editTextField.txt';

class StampView extends StatefulWidget {
  @override
  _StampViewState createState() => _StampViewState();
}

class _StampViewState extends State<StampView> {
  StampTotalModel _stamptotal = new StampTotalModel();

  @override
  Widget build(BuildContext context) {
    final CommonViewModel data = Provider.of<CommonViewModel>(context);
    _getStampTotal();
    return Column(
        children: [
          Text(
              _stamptotal.stamp_count.toString() + "個",
              style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
          ),
          Expanded(child: _createGrid(_stamptotal))
        ]
    );
  }

  Future<void> _getStampTotal() async{
    await getStampTotal().then((value) => _stamptotal = value);
  }

  Widget _createGrid(StampTotalModel stamptotal) {
    if(stamptotal == null){
      return Text("table");
    }
    Widget base = StampTotalElement(stamptotal: stamptotal);
    return base;
  }
}

class StampTotalElement extends StatelessWidget {
  final StampTotalModel stamptotal;

  StampTotalElement({
    this.stamptotal
  });

  @override
  Widget build(BuildContext context) {
    final CommonViewModel data = Provider.of<CommonViewModel>(context);
    if(stamptotal.stamp_count != null) {
      int basecount = stamptotal.stamp_count % 10;
      if(basecount == 0){
        basecount = 10;
      }

      return Container(
          child:
                GridView.count(
                  primary: false,
                  padding: const EdgeInsets.all(10),
                  crossAxisSpacing: 2,
                  mainAxisSpacing: 2,
                  crossAxisCount: 5,
                  children:  <Widget>[
                      if(basecount >= 1) Center(child: FaIcon(FontAwesomeIcons.stamp),),
                      if(basecount >= 2) Center(child: FaIcon(FontAwesomeIcons.stamp),),
                      if(basecount >= 3) Center(child: FaIcon(FontAwesomeIcons.stamp),),
                      if(basecount >= 4) Center(child: FaIcon(FontAwesomeIcons.stamp),),
                      if(basecount >= 5) Center(child: FaIcon(FontAwesomeIcons.stamp),),
                      if(basecount >= 6) Center(child: FaIcon(FontAwesomeIcons.stamp),),
                      if(basecount >= 7) Center(child: FaIcon(FontAwesomeIcons.stamp),),
                      if(basecount >= 8) Center(child: FaIcon(FontAwesomeIcons.stamp),),
                      if(basecount >= 9) Center(child: FaIcon(FontAwesomeIcons.stamp),),
                      if(basecount >= 10) Center(child: FaIcon(FontAwesomeIcons.stamp),),
                      ],
                    )
      );
    }else{
      return Container(child:Text("loding"));
    }
  }
}





