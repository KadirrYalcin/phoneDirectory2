import 'package:flutter/material.dart';
import 'package:phonediretory2/core/models/request_model.dart/user_login_model/user_login_model.dart';
import 'package:phonediretory2/main.dart';
import 'package:phonediretory2/shared/strings/shared_prefs_keys.dart';
import '../../core/service/functions/auth_service_functions.dart';
import '../../shared/strings/strings.dart';
import '../../widgets/toast_widget.dart';

class VMLogin extends ChangeNotifier {
  static final TextEditingController emailTextEditingController =
      TextEditingController();
  static final TextEditingController passwordTextEditingController =
      TextEditingController();
  static String? unClickableReason;
  static bool rememberMe = false;

  bool loginin = false;
  bool isTimeOut = false;
  void showForgotPassword() {}
  void goToRegister({required BuildContext context}) {
    Navigator.pushReplacementNamed(context, '/register');
  }

  void navigateBasedOnLoginStatus(BuildContext context) async {
    loginin = await AuthFunctions.tryRemember(context: context).timeout(
      const Duration(seconds: 2),
      onTimeout: () {
        isTimeOut = true;
        return false;
      },
    );

    if (loginin) {
      // ignore: use_build_context_synchronously
      Navigator.pushReplacementNamed(context, '/home');
    } else if (isTimeOut) {
      prefs.setString(PrefsKeys.userPassword, "");
      prefs.setString(PrefsKeys.userEmail, "");
      prefs.setString(PrefsKeys.userToken, "");
    }
    notifyListeners();
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
