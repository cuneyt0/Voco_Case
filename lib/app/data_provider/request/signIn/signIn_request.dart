import 'package:voco_case/app/data_provider/data_core/base_client.dart';

class SignInRequest extends BaseClient {
  @override
  String path = "/api/login";

  @override
  String method = "POST";

  @override
  Map<String, dynamic>? body;

  @override
  Map<String, dynamic>? params;

  SignInRequest() {
    body = {"email": "eve.holt@reqres.in", "password": "cityslicka"};
  }
}
