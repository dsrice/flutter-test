import 'package:chopper/chopper.dart';

part 'loginService.chopper.dart';

@ChopperApi(baseUrl: '/v1')
abstract class loginService extends ChopperService {
  static loginService create([ChopperClient client]) =>
      _$loginService(client);

  @Post(headers: {'content-type': 'application / json'}, path: '/auth/token')
  Future<Response> getTodo(Map<String, dynamic> request);
}
