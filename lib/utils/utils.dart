import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Utils {
  static showToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      backgroundColor: Colors.blue,
      textColor: Colors.white,
    );
  }

  static showFlushbarErrorMsg(BuildContext context, String message) {
    showFlushbar(
        context: context,
        flushbar: Flushbar(
          icon: const Icon(Icons.error, color: Colors.white),
          message: message,
          backgroundColor: Colors.red,
          messageColor: Colors.white,
          duration: const Duration(seconds: 2),
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          margin: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
        )..show(context));
  }

  static filedFocusChange(BuildContext context, FocusNode from, FocusNode to) {
    from.unfocus();
    FocusScope.of(context).requestFocus(to);
  }
}
