import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ToastManager {
  static Future<void> showToast(String message,
      {int timeInSecForIosWeb = 3}) async {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: timeInSecForIosWeb,
        backgroundColor: Colors.white,
        textColor: Colors.black,
        fontSize: 16.0);

    return;
  }

  static Future<void> showSuccess(String message,
      {int timeInSecForIosWeb = 3}) async {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: timeInSecForIosWeb,
        backgroundColor: Colors.greenAccent,
        textColor: Colors.black,
        fontSize: 16.0);

    return;
  }

  static Future<void> showError(String message,
      {int timeInSecForIosWeb = 3}) async {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: timeInSecForIosWeb,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);

    return;
  }
}
