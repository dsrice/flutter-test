import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable(createToJson: false)
class LoginModel{
  final String token;

  LoginModel({this.token});
  factory LoginModel.fromJson(Response response) => _LoginModelFromJson(response);

}

LoginModel _LoginModelFromJson(Response response){
  var map = json.decode(response.toString());
  return LoginModel(
    token: map["token"]
  );
}