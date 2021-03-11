import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable(createToJson: false)
class ArticlesModel {
  final List<ArticleModel> articles;

  ArticlesModel({this.articles});
  factory ArticlesModel.fromJson(Response response) => _$ArticlesModelFromJson(response);
}

ArticlesModel _$ArticlesModelFromJson(Response response) {
  var articles = json.decode(response.toString());
  List articles_map =  articles["articles"];
  List<ArticleModel> articleList = [];
  articles_map.forEach((element) {
    ArticleModel article = _$ArticleModelFromJson(element);
    articleList.add(article);
  });
  return ArticlesModel(
      articles: articleList
  );
}

class ArticleModel {
  final String title;
  final String body;
  final int article_id;

  ArticleModel({this.title, this.body, this.article_id});
  factory ArticleModel.fromJson(Map<String, dynamic> json) => _$ArticleModelFromJson(json);
}

ArticleModel _$ArticleModelFromJson(Map<String, dynamic> json) {
  return ArticleModel(
      title: json["title"],
      body: json["body"],
      article_id: json["article_id"] as int
  );
}