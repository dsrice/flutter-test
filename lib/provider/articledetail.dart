import 'package:flutter/cupertino.dart';

class ArticleDetailProvider with ChangeNotifier{
  final BuildContext context;

  ArticleDetailProvider({
    @required this.context,
  }): assert(context != null);

}