import 'package:flutter/material.dart';

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
    Navigator.pushReplacementNamed(context, '/register');
  }

  void loginButtonFunc({required BuildContext context}) {
    Navigator.pushReplacementNamed(context, '/home');
  }

  void changeRemember() {
    rememberMe = !rememberMe;
    notifyListeners();
  }
}
