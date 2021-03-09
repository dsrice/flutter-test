import 'package:flutter/cupertino.dart';

class RootProvider with ChangeNotifier{
  final BuildContext context;

  RootProvider({
    @required this.context,
  }): assert(context != null);

}