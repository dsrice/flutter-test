import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/model/article.dart';
import 'package:flutter_app/provider/article.dart';
import 'package:flutter_app/provider/articledetail.dart';
import 'package:flutter_app/provider/login.dart';
import 'package:flutter_app/provider/stampProvider.dart';
import 'package:flutter_app/service/navigationService.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class ArticleDetailArguments{
  ArticleModel article;
  ArticleDetailArguments(this.article);
}

class ArticleDetailView extends StatefulWidget {
  final ArticleModel article;

  ArticleDetailView({
    @required this.article
  }) : assert(article != null);

  @override
  _ArticleDetailViewState createState() => _ArticleDetailViewState();
}

class _ArticleDetailViewState extends State<ArticleDetailView> {

  @override
  Widget build(BuildContext context) {
    final watch = context.watch<ArticleDetailProvider>();
    watch.getArticleDetail(widget.article);
    return Scaffold(
      body:Container(
        child: _createView(context),
      )
    );
  }

  Widget _createView(BuildContext context){
    return context
        .watch<ArticleDetailProvider>()
        .loading
        ? _loadingIndicator(context) : _createArticle(context);
  }

  Widget _loadingIndicator(BuildContext context){
    Future.delayed(Duration(milliseconds: 1000),
            () => context.read<ArticleDetailProvider>().check());

    return Center(
      child: CircularProgressIndicator(
        strokeWidth: 4,
      ),
    );
  }

  Widget _createArticle(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: Visibility(
            child: IconButton(
              icon: const FaIcon(FontAwesomeIcons.chevronLeft),
              color: Colors.black,
              onPressed: (){
                NavigationService.instance.goBack();
              },
            ),
          ),
          backgroundColor: Colors.white,
        ),
        body: Column(
          children:[
            Text(
                context.read<ArticleDetailProvider>().articleDetailModel.title,
                style:  TextStyle(fontWeight: FontWeight.bold, fontSize: 30)
            ),
            Html(
                data: context.read<ArticleDetailProvider>().articleDetailModel.body
            )
          ],
        )
    );
  }
}

