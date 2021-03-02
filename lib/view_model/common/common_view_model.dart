
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class CommonViewModel extends ChangeNotifier {
  bool _loginflg = false;
  String token = "";

  int _screenid = 0;
  int _selectedindex = -1;
  int _article_id = -1;

  PageController _pageController;

  void setScreenID(int id){
    _screenid = id;
    notifyListeners();
  }

  void setSelectedIndex(int index){
    _selectedindex = index;
    notifyListeners();
  }

  int getSelectdIndex(){
    return _selectedindex;
  }

  void setPageController(PageController controller){
    _pageController = controller;
    notifyListeners();
  }

  PageController getPageController(){
    return _pageController;
  }

  void movePage(int index){
    _pageController.animateToPage(index, duration: Duration(milliseconds: 300), curve: Curves.easeIn);
    notifyListeners();
  }

  void setArticleID(int id){
    _article_id = id;
    _pageController.animateToPage(3, duration: Duration(milliseconds: 300), curve: Curves.easeIn);
    notifyListeners();
  }
}