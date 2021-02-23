// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'loginService.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

class _$loginService extends loginService {
  _$loginService([ChopperClient client]) {
    if (client == null) return;
    this.client = client;
  }

  final definitionType = loginService;

  Future<Response> getTodo(Map<String, dynamic> request) {
    final $url = '/v1/auth/token';
    final $headers = {'content-type': 'application / json'};
    final $request = Request('POST', $url, client.baseUrl, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }
}
