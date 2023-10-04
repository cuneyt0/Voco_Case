import 'package:flutter/material.dart';
import 'package:voco_case/app/constant/string_constant.dart';
import 'package:voco_case/app/data_provider/data_core/freezed/error/custom_error.dart';
import 'package:voco_case/app/data_provider/data_core/freezed/sw_error.dart';
import 'package:voco_case/app/data_provider/data_core/layers/network_executer.dart';
import 'package:voco_case/app/data_provider/model/signIn/signIn.dart';
import 'package:voco_case/app/data_provider/request/signIn/signIn_request.dart';
import 'package:voco_case/app/screen/users/view/users_view.dart';
import 'package:voco_case/app/utilities/cache_manager/cache_manager.dart';
import 'package:voco_case/app/utilities/toast_manager/toast_manager.dart';
import 'package:voco_case/core/freezed/result_state.dart';

class SignInController extends ChangeNotifier {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey();
  bool isShowPassword = false;
  ResultState<SignIn, SwError> resultState = const Idle();
  String? get token => _token;
  String? _token;

  Future<void> signInButton(BuildContext context) async {
    if (formKey.currentState != null && formKey.currentState!.validate()) {
      _postSignIn(context);
    } else {
      ToastManager.showError("Zorunlu alanları doldurunuz");
    }
  }

  Future<void> _postSignIn(BuildContext context) async {
    resultState = const Pending();

    var result = await NetworkExecuter.shared.execute<SignIn, SignIn>(
        route: SignInRequest(
            email: emailController.text, password: passwordController.text),
        responseType: SignIn());
    result.when(success: ((data) async {
      await CacheManager.instance.saveToken(data.token.toString());
      _token = data.token;
      ToastManager.showSuccess(signInSuccessMessage);
      resultState = Completed(data);
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (context) => const UsersView(),
          ),
          (Route<dynamic> route) => false);
    }), failure: (error) {
      resultState = Failed(SwError(errorMessage: error.localizedErrorMessage));
      ToastManager.showError(error.handleError.error ?? '-');
    });
    notifyListeners();
  }

  void showPassword() {
    isShowPassword = !isShowPassword;
    notifyListeners();
  }

  String? emailValidation({String? value}) {
    const pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    final regex = RegExp(pattern);
    if (!regex.hasMatch(value!)) {
      return invalidEmail;
    } else {
      return null;
    }
  }

  String? passwordValidation({String? value}) {
    if (value?.isEmpty == true) {
      return emptyMessage;
    } else {
      return null;
    }
  }
}
