import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable(createToJson: false)
class ArticleDetailModel {
  final String title;
  final String body;
  final int article_id;
  final int next_id;
  final int prov_id;

  ArticleDetailModel({this.title, this.body, this.article_id, this.next_id, this.prov_id});
  factory ArticleDetailModel.fromJson(Response response) => _$ArticleDetailModelFromJson(response);
}

ArticleDetailModel _$ArticleDetailModelFromJson(Response response) {
  var result = json.decode(response.toString());
  return ArticleDetailModel(
      title: result["title"],
      body: result["body"],
      article_id: result["article_id"] as int,
      next_id: result["next_id"] as int,
      prov_id: result["prov_id"] as int
  );
}