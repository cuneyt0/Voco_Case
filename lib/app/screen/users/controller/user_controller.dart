import 'package:flutter/material.dart';
import 'package:voco_case/app/data_provider/data_core/freezed/sw_error.dart';
import 'package:voco_case/app/data_provider/data_core/layers/network_executer.dart';
import 'package:voco_case/app/data_provider/model/users/user/user.dart';
import 'package:voco_case/app/data_provider/request/user/user_request.dart';
import 'package:voco_case/app/screen/splash/view/splash_view.dart';
import 'package:voco_case/app/utilities/cache_manager/cache_manager.dart';
import 'package:voco_case/core/freezed/result_state.dart';

class UserController extends ChangeNotifier {
  ResultState<User, SwError> resultState = const Idle();

  void init() {
    _fetchUser();
  }

  Future<void> _fetchUser() async {
    resultState = const Pending();
    var result = await NetworkExecuter.shared
        .execute<User, User>(route: UserRequest(page: 0), responseType: User());
    result.when(success: ((data) async {
      if (data.data?.isEmpty == true) {
        resultState = const ResultState.empty();
      } else {
        resultState = Completed(data);
      }
    }), failure: (error) {
      resultState = Failed(SwError(errorMessage: error.localizedErrorMessage));
    });
    notifyListeners();
  }

  Future<void> logOut(BuildContext context) async {
    await CacheManager.instance.removeToken();
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (context) => const SplashView(),
        ),
        (Route<dynamic> route) => false);
    notifyListeners();
  }
}
