import 'package:flutter/cupertino.dart';

class ArticleProvider with ChangeNotifier{
  final BuildContext context;

  ArticleProvider({
    @required this.context,
  }): assert(context != null);

}