import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_app/model/stamptotal.dart';
import 'package:flutter_app/service/api/stamp.dart';

class StampProvider with ChangeNotifier{
  final BuildContext context;

  StampProvider({
    @required this.context,
  }): assert(context != null);

  StampTotalModel _stamptotalmodel;

  get stamptotalmodel => _stamptotalmodel;

  bool _loading = true;

  bool get loading => _loading;

  set loading(bool value){
    _loading = value;
    notifyListeners();
  }


  void stampinfo() async {
    StampTotalModel response = await StampService.getStampTotal();
    if(response != null){
      this._stamptotalmodel = response;
    }
  }

  // 初期のいろいろ確認用
  void check() async {
    print(_stamptotalmodel);
    if(_stamptotalmodel != null){
     loading = false;
    }else{
      loading = true;
    }
  }
}