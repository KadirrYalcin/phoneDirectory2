import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:phonediretory2/shared/colors/uicolors.dart';

void showToastMessage(String message) {
  Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.TOP,
    timeInSecForIosWeb: 1,
    backgroundColor: UIColors.grey,
    textColor: Colors.white,
    fontSize: 16.0,
  );
}
