import 'package:voco_case/app/data_provider/data_core/freezed/network_error.dart';
import 'package:voco_case/app/data_provider/data_core/interfaces/base_network_model.dart';

class CustomError extends BaseNetworkModel<CustomError> implements Exception {
  String? error;
  String? customError;

  CustomError({error, this.customError});

  CustomError.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    customError = json['customError'];
  }

  @override
  CustomError fromJson(Map<String, dynamic> json) => CustomError.fromJson(json);
}

extension OMISErrorExtension on NetworkError {
  CustomError get handleError => when(
      request: (error) {
        final decode = CustomError.fromJson(error.response?.data);
        return decode;
      },
      type: (error) => CustomError(customError: error),
      connectivity: (error) => CustomError(customError: error));
}
