import 'package:flutter/cupertino.dart';

class UserInfoProvider with ChangeNotifier{
  final BuildContext context;

  UserInfoProvider({
    @required this.context,
  }): assert(context != null);

}