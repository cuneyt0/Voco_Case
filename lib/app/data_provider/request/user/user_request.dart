import 'package:voco_case/app/data_provider/data_core/base_client.dart';

class UserRequest extends BaseClient {
  @override
  String path = "users";

  @override
  String method = "GET";

  @override
  Map<String, dynamic>? body;

  @override
  Map<String, dynamic>? params;

  UserRequest({int? page}) {
    params = {"page": page};
  }
}
