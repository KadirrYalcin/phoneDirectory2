import 'package:flutter/material.dart';

class VMRegister extends ChangeNotifier {
  static final TextEditingController nameTextEditingController =
      TextEditingController();
  static final TextEditingController emailTextEditingController =
      TextEditingController();
  static final TextEditingController passwordTextEditingController =
      TextEditingController();
  static final TextEditingController passwordAgainTextEditingController =
      TextEditingController();
  bool isClickalbe = false;
  VMRegister() {
    nameTextEditingController.addListener(() {
      changeClickable();
    });
    emailTextEditingController.addListener(() {
      changeClickable();
    });
    passwordTextEditingController.addListener(() {
      changeClickable();
    });
    passwordAgainTextEditingController.addListener(() {
      changeClickable();
    });
  }
  void changeClickable() {
    if (nameTextEditingController.text.isNotEmpty &&
        emailTextEditingController.text.isNotEmpty &&
        passwordTextEditingController.text.isNotEmpty &&
        passwordAgainTextEditingController.text.isNotEmpty) {
      isClickalbe = true;
    } else {
      isClickalbe = false;
    }
    notifyListeners();
  }

  void registerButtonFunc({required BuildContext context}) {
    Navigator.pushReplacementNamed(context, '/home');
  }

  void goToLogin({required BuildContext context}) {
    Navigator.pushReplacementNamed(context, '/');
  }
}
