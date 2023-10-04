import 'package:voco_case/app/data_provider/data_core/interfaces/request_protocol.dart';

abstract class BaseClient implements RequestProtocol {
  @override
  String baseURL = "https://reqres.in";

  @override
  Map<String, dynamic>? header;

  @override
  bool get isFormDataBody => false;
}
