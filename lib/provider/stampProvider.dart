import 'package:flutter/cupertino.dart';

class StampProvider with ChangeNotifier{
  final BuildContext context;

  StampProvider({
    @required this.context,
  }): assert(context != null);

}