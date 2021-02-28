import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable(createToJson: false)
class ArticlesModel {
  final List<ArticleModel> articles;

  ArticlesModel({this.articles});
  factory ArticlesModel.fromJson(Response response) => _$ArticlesModelFromJson(response);
}

_$ArticlesModelFromJson(Response response) {
  var articles = json.decode(response.toString());
  articles["articles"].map<ArticleModel>((i) =>_$ArticleModelFromJson(i)).toList();
}

class ArticleModel {
  final String title;
  final String body;
  final int article_id;

  ArticleModel({this.title, this.body, this.article_id});
  factory ArticleModel.fromJson(Map<String, dynamic> json) => _$ArticleModelFromJson(json);
}

_$ArticleModelFromJson(Map<String, dynamic> json) {
  return ArticleModel(
    title: json["title"],
    body: json["body"],
    article_id: json["article_id"] as int
  );
}
