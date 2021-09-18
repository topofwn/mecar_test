

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ToastUtil {
  static void showToast(
      String mess, {
        Toast toastLength = Toast.LENGTH_LONG,
        ToastGravity gravity = ToastGravity.BOTTOM,
        Color backgroundColor = Colors.grey,
        Color textColor = Colors.white,
        double fontSize = 16,
      }) {
    Fluttertoast.showToast(
      msg: mess,
      toastLength: toastLength,
      gravity: gravity,
      timeInSecForIosWeb: 1,
      backgroundColor: backgroundColor,
      textColor: textColor,
      fontSize: fontSize,
    );
  }
}