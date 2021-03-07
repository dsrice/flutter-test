import 'package:flutter/cupertino.dart';

class LoginProvider with ChangeNotifier{
  final BuildContext context;

  LoginProvider({
    @required this.context,
  }): assert(context != null);

}