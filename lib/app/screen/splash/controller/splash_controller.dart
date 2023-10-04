import 'dart:async';

import 'package:flutter/material.dart';
import 'package:voco_case/app/screen/sign_in/view/signIn_view.dart';
import 'package:voco_case/app/screen/users/view/users_view.dart';
import 'package:voco_case/app/utilities/cache_manager/cache_manager.dart';

class SplashController extends ChangeNotifier {
  Future<void> checkUsers(BuildContext context) async {
    Future.delayed(const Duration(seconds: 1)).then(
      (_) async {
        await CacheManager.instance.getToken().then(
          (data) async {
            if (data?.isNotEmpty == true) {
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                    builder: (context) => const UsersView(),
                  ),
                  (Route<dynamic> route) => false);
            } else {
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                    builder: (context) => const SignInView(),
                  ),
                  (Route<dynamic> route) => false);
            }
          },
        );
      },
    );
    notifyListeners();
  }
}
