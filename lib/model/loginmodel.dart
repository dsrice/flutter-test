import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable(createToJson: false)
class LoginModel {
  final String token;

  LoginModel({this.token});
  factory LoginModel.fromJson(Response response) => _$LoginModelFromJson(response);
  Map<String, dynamic> toJson() => _$LoginModelToJson(this);


}

LoginModel _$LoginModelFromJson(Response response) {
  var map = json.decode(response.toString());
  return LoginModel(
      token: map["token"] as String
  );
}

Map<String, dynamic> _$LoginModelToJson(LoginModel instance) => <String, dynamic>{
  'token': instance.token,
};
