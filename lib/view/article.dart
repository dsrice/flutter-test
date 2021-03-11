import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/model/article.dart';
import 'package:flutter_app/provider/article.dart';
import 'package:flutter_app/provider/login.dart';
import 'package:flutter_app/provider/stampProvider.dart';
import 'package:provider/provider.dart';

class ArticleView extends StatefulWidget {
  @override
  _ArticleViewState createState() => _ArticleViewState();
}

class _ArticleViewState extends State<ArticleView> {

  @override
  Widget build(BuildContext context) {
    final watch = context.watch<ArticleProvider>();
    watch.getArticles();
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        title: const Text("スタンプ状況"),
        centerTitle: true,
      ),
      body: Container(
          padding: const EdgeInsets.all(0.0),
          child: _createListView(context)
          )
      );
  }

  Widget _createListView(BuildContext context){
    return context
        .watch<ArticleProvider>()
        .loading
        ? _loadingIndicator(context) : _createList(context);
  }

  Widget _loadingIndicator(BuildContext context){
    Future.delayed(Duration(milliseconds: 1000),
            () => context.read<ArticleProvider>().check());

    return Center(
        child: CircularProgressIndicator(
          strokeWidth: 4,
        ),
      );
  }


  Widget _createList(BuildContext context) {
    List<Widget> list = [];

    ListView result = ListView(
      children: list,
    );

    context
        .read<ArticleProvider>()
        .articleModel
        .articles
        .forEach((element) {
      Widget base = ArticleElement(article: element);
      list.add(base);
    });
    return result;
  }
}

class ArticleElement extends StatelessWidget {
  final ArticleModel article;

  ArticleElement({
    this.article
  });

  @override
  Widget build(BuildContext context) {
    return Card(
        child: InkWell(
            child: Container(
              padding: EdgeInsets.all(30.0),
              decoration: new BoxDecoration(
                  border: new Border(bottom: BorderSide(width: 1.0, color: Colors.grey))
              ),
              child: Row(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.all(10.0),
                  ),
                  Text(
                    article.title,
                    style: TextStyle(
                        color:Colors.black,
                        fontSize: 18.0
                    ),
                  ),
                ],
              ),
            ),
            onTap: (){
              print("tap");
              print(this.article.article_id);
            }
        )
    );
  }
}
