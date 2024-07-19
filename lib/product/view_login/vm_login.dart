import 'package:flutter/material.dart';

import '../../shared/strings/strings.dart';
import '../../widgets/toast_widget.dart';

class VMLogin with ChangeNotifier {
  static final TextEditingController emailTextEditingController =
      TextEditingController();
  static final TextEditingController passwordTextEditingController =
      TextEditingController();
  String? unClickableReason;
  bool rememberMe = false;

  void showForgotPassword() {}
  void goToRegister({required BuildContext context}) {
    Navigator.pushReplacementNamed(context, '/register');
  }

  void loginButtonFunc({required BuildContext context}) {
    if (emailTextEditingController.text.isEmpty ||
        emailTextEditingController.text == "") {
      unClickableReason = Strings.enterEmailMessage;
    } else if (passwordTextEditingController.text.isEmpty ||
        passwordTextEditingController.text == "") {
      unClickableReason = Strings.enterPasswordMessage;
    }
    if (unClickableReason != null) {
      showToastMessage(unClickableReason!);
    } else {
      Navigator.pushReplacementNamed(context, '/home');
    }
  }

  void changeRemember() {
    rememberMe = !rememberMe;
    notifyListeners();
  }
}
