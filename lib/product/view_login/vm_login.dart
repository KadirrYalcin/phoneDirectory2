import 'package:flutter/material.dart';

import '../view_home/view_home.dart';
import '../view_register/view_register.dart';

class VMLogin with ChangeNotifier {
  static final TextEditingController emailTextEditingController =
      TextEditingController();
  static final TextEditingController passwordTextEditingController =
      TextEditingController();
  bool isClickalbe = false;
  bool rememberMe = false;
  VMLogin() {
    emailTextEditingController.addListener(() {
      changeClickable();
    });
    passwordTextEditingController.addListener(() {
      changeClickable();
    });
  }
  void changeClickable() {
    if (emailTextEditingController.text.isNotEmpty &&
        passwordTextEditingController.text.isNotEmpty) {
      isClickalbe = true;
    } else {
      isClickalbe = false;
    }
    notifyListeners();
  }

  void showForgotPassword() {}
  void goToRegister({required BuildContext context}) {
    Navigator.push(context,
        MaterialPageRoute(builder: (BuildContext context) => ViewRegister()));
  }

  void loginButtonFunc({required BuildContext context}) {
    Navigator.push(context,
        MaterialPageRoute(builder: (BuildContext context) => ViewHome()));
  }

  void changeRemember() {
    rememberMe = !rememberMe;
    notifyListeners();
  }
}
