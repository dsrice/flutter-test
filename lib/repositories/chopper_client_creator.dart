import 'package:chopper/chopper.dart';

class ChopperClientCreator {
  static final String baseUrl = "http://10.0.2.2:8000";

  static ChopperClient create() {
    return ChopperClient(
      baseUrl: ChopperClientCreator.baseUrl,
      converter: JsonConverter(),
      errorConverter: JsonConverter()
    );
  }
}