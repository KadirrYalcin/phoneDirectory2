import 'package:flutter/material.dart';
import 'package:phonediretory2/core/models/request_model.dart/user_login_model/user_login_model.dart';
import '../../core/service/auth_service_functions.dart';
import '../../shared/strings/strings.dart';
import '../../widgets/toast_widget.dart';

class VMLogin {
  static final TextEditingController emailTextEditingController =
      TextEditingController();
  static final TextEditingController passwordTextEditingController =
      TextEditingController();
  static String? unClickableReason;
  static bool rememberMe = false;

  void showForgotPassword() {}
  void goToRegister({required BuildContext context}) {
    Navigator.pushReplacementNamed(context, '/register');
  }

  static void loginButtonFunc({
    required BuildContext context,
  }) async {
    if (emailTextEditingController.text.isEmpty ||
        emailTextEditingController.text == "") {
      unClickableReason = Strings.enterEmailMessage;
    } else if (passwordTextEditingController.text.isEmpty ||
        passwordTextEditingController.text == "") {
      unClickableReason = Strings.enterPasswordMessage;
    } else {
      unClickableReason = null;
    }
    if (unClickableReason != null) {
      showToastMessage(unClickableReason!);
    } else {
      UserLoginModel loginModel = UserLoginModel(
          email: emailTextEditingController.text,
          password: passwordTextEditingController.text);
      await AuthFunctions.tryLogin(
          context: context,
          userLoginModel: loginModel,
          rememberClicked: rememberMe);
    }
  }
}
