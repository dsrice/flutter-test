import 'package:flutter_app/ui/article/article.dart';
import 'package:flutter_app/ui/article_detail/article_detail.dart';
import 'package:flutter_app/ui/bottombar/bottombar.dart';
import 'package:flutter_app/ui/login/loginvies.dart';
import 'package:flutter_app/ui/stamp/stamp.dart';
import 'package:flutter_app/view_model/common/common_view_model.dart';

import '../importer.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CommonArea extends StatefulWidget{
  @override
  _CommonAreaState createState() => new _CommonAreaState();
}

class _CommonAreaState extends State<CommonArea>{
  final data = CommonViewModel();

  static List<Widget> _pageList = [
    LoginView(),
    StampView(),
    ArticleView(),
    ArticleDetailView(),
  ];

  PageController _pageController;

  void _onPageChanged(int index) {
    setState(() {
      data.setScreenID(index);
    });
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      initialPage: 0,
    );
  }

  @override
  Widget build(BuildContext context) {
    int _select = data.getSelectdIndex();
    bool barflg = false;
    if(_select >= 0){
      barflg = true;
    }
    data.setPageController(_pageController);
    return ChangeNotifierProvider<CommonViewModel>.value(
      value: data,
      child: Scaffold(
            appBar: AppBar(
              title: Text("Demoアプリ"),
            ),
            body: PageView(
              controller: _pageController,
              onPageChanged: _onPageChanged,
              children: _pageList,
            ),
            bottomNavigationBar: Visibility(
              visible: barflg,
              child: BottomBarView(),
            )
          )
    );
  }
}




