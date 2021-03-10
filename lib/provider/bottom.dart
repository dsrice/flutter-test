import 'package:flutter/cupertino.dart';

class BottomProvider with ChangeNotifier{
  final BuildContext context;

  BottomProvider({
    @required this.context,
  }): assert(context != null);

  bool _loading = true;

  bool get loading => _loading;

  set loading(bool value){
    _loading = value;
    notifyListeners();
  }

  int _selectIndex = 0;

  int get selectIndex => _selectIndex;

  set selectIndex(int value){
    _selectIndex = value;
    notifyListeners();
  }

  // 初期のいろいろ確認用
  void check() async {
    loading = false;
  }
}