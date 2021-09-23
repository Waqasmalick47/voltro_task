import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ToastWidget {
  static showToast(String message,
      {backgroundColor: Colors.black87, timeInSeconds: 1}) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: timeInSeconds,
        backgroundColor: backgroundColor,
        textColor: Colors.white,
        fontSize: 14.0);
  }
}
