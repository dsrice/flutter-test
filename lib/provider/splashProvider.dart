import 'package:flutter/cupertino.dart';

class SplashProvider with ChangeNotifier{
  final BuildContext context;

  SplashProvider({
    @required this.context,
  }): assert(context != null);

  Future<bool> version() async {
    // 擬似的に通信中を表現するために１秒遅らせる
    await Future.delayed(
      Duration(seconds: 1),
    );
    return true;
  }
}