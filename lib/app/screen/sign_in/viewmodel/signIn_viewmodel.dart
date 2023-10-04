import 'package:flutter/material.dart';
import 'package:voco_case/app/data_provider/data_core/freezed/sw_error.dart';
import 'package:voco_case/app/data_provider/data_core/layers/network_executer.dart';
import 'package:voco_case/app/data_provider/model/signIn/signIn.dart';
import 'package:voco_case/app/data_provider/request/signIn/signIn_request.dart';
import 'package:voco_case/core/freezed/result_state.dart';

class SignInViewModel extends ChangeNotifier {
  final TextEditingController controller = TextEditingController();
  ResultState<SignIn, SwError> resultState = const Idle();
  Future<void> postSignIn() async {
    resultState = const Pending();

    var result = await NetworkExecuter.shared.execute<SignIn, SignIn>(
        route: SignInRequest(), responseType: SignIn());

    result.when(success: ((data) {
      resultState = Completed(data);
    }), failure: (error) {
      resultState = Failed(SwError(errorMessage: error.localizedErrorMessage));
    });
    notifyListeners();
  }
}
