
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable(createToJson: false)
class StampTotalModel {
  final String loginid;
  final int stamp_count;

  StampTotalModel({
    this.loginid,
    this.stamp_count
  });

  factory StampTotalModel.fromJson(Response response) =>
      _StampTotalModelFromJson(response);
}

StampTotalModel _StampTotalModelFromJson(Response response){
  var result = json.decode(response.toString());
  return StampTotalModel(
    loginid: result["loginid"],
    stamp_count: result["stamp_count"] as int,
  );
}
