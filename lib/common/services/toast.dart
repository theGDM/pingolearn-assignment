import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ToastFlutter {
  void toast(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      timeInSecForIosWeb: 2,
      backgroundColor: const Color.fromARGB(255, 55, 54, 74),
      textColor: Colors.white,
      fontSize: 15,
      gravity: ToastGravity.TOP,
      webShowClose: true,
    );
  }
}
