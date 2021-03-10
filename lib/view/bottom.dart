import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/provider/article.dart';
import 'package:flutter_app/provider/bottom.dart';
import 'package:flutter_app/provider/login.dart';
import 'package:flutter_app/provider/stampProvider.dart';
import 'package:flutter_app/provider/userinfo.dart';
import 'package:flutter_app/view/article.dart';
import 'package:flutter_app/view/stampView.dart';
import 'package:flutter_app/view/userinfo.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class BottomView extends StatefulWidget {
  @override
  _BottomViewState createState() => _BottomViewState();
}

class _BottomViewState extends State<BottomView> with SingleTickerProviderStateMixin{
  AnimationController _controller;
  Animation _animation;

  @override
  void initState(){
    super.initState();
    _controller = AnimationController(
        vsync: this,
        duration: Duration(seconds: 2)
    );

    _animation = Tween(
        begin: 1.0,
        end:1.0
    ).animate(_controller);

    _animation.addStatusListener((status) {
      if(status == AnimationStatus.completed){
        context.read<BottomProvider>().check();
      }
    });

  }

  @override
  Widget build(BuildContext context) {
    return context
        .watch<BottomProvider>()
        .loading
        ? _loadingIndicator(context) : _buildContext(context);
  }

  Widget _loadingIndicator(BuildContext context){
    Future.delayed(Duration(seconds: 1),
        () => context.read<BottomProvider>().check());

    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(
          strokeWidth: 4,
        ),
      ),
    );
  }

  Widget _buildContext(BuildContext context) {
    final watch = context.watch<BottomProvider>();

    List<Widget> _pageList = [
      ChangeNotifierProvider(
        create: (context) => StampProvider(context: context),
        child: StampView(),
      ),
      ChangeNotifierProvider(
        create: (context) => ArticleProvider(context: context),
        child: ArticleView(),
      ),
      ChangeNotifierProvider(
        create: (context) => UserInfoProvider(context: context),
        child: UserInfoView(),
      ),
    ];

    return Scaffold(
            body: FadeTransition(
              opacity: _animation,
              child: _pageList.elementAt(context.watch<BottomProvider>().selectIndex),
            ),
            bottomNavigationBar: BottomNavigationBar(
              items: [
                BottomNavigationBarItem(icon: FaIcon(FontAwesomeIcons.stamp), label: "スタンプ"),
                BottomNavigationBarItem(icon:  FaIcon(FontAwesomeIcons.bookOpen), label: "記事"),
                BottomNavigationBarItem(icon: FaIcon(FontAwesomeIcons.userAlt), label: "設定"),
              ],
              currentIndex: context.watch<BottomProvider>().selectIndex,
              onTap: (index){
                context.read<BottomProvider>().selectIndex = index;
//                _pageContorller.animateToPage(index, duration: Duration(milliseconds: 300), curve: Curves.easeIn);
              },
      ),
    );
  }

  Widget _fadeInStamp(BuildContext context){
    return SingleChildScrollView(
      child: Container(
        child: Text("stamp")
        ),
    );

  }
  Future<String> _getFutureValue() async {
    // 擬似的に通信中を表現するために１秒遅らせる
    await Future.delayed(
      Duration(seconds: 1),
    );
    return Future.value("データの取得に成功しました");
  }


}