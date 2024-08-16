import 'package:flutter/material.dart';
import 'package:phonediretory2/core/models/request_model.dart/user_register_model/user_register_model.dart';
import 'package:phonediretory2/core/service/auth_service_functions.dart';

import '../../shared/strings/strings.dart';
import '../../widgets/toast_widget.dart';

class VMRegister extends ChangeNotifier {
  static final TextEditingController nameTextEditingController =
      TextEditingController();
  static final TextEditingController emailTextEditingController =
      TextEditingController();
  static final TextEditingController passwordTextEditingController =
      TextEditingController();
  static final TextEditingController passwordAgainTextEditingController =
      TextEditingController();
  String? unClickableReason;

  void registerButtonFunc({required BuildContext context}) async {
    if (nameTextEditingController.text.isEmpty ||
        nameTextEditingController.text == "") {
      unClickableReason = Strings.enterNameSurnameMessage;
    } else if (emailTextEditingController.text.isEmpty ||
        emailTextEditingController.text == "") {
      unClickableReason = Strings.enterEmailMessage;
    } else if (passwordTextEditingController.text.isEmpty ||
        passwordTextEditingController.text == "") {
      unClickableReason = Strings.enterPasswordMessage;
    } else if (passwordAgainTextEditingController.text.isEmpty ||
        passwordAgainTextEditingController.text == "") {
      unClickableReason = Strings.enterPasswordAgainMessage;
    } else if (passwordTextEditingController.text ==
        passwordAgainTextEditingController.text) {
      unClickableReason = Strings.passwordsNotMatched;
    }
    if (unClickableReason != null) {
      showToastMessage(unClickableReason!);
    } else {
      UserRegisterModel userRegisterModel = UserRegisterModel(
          fullName: nameTextEditingController.text,
          email: emailTextEditingController.text,
          password: passwordTextEditingController.text);
      await AuthFunctions.tryRegister(
          context: context, userRegisterModel: userRegisterModel);
    }
  }

  void goToLogin({required BuildContext context}) {
    Navigator.pushReplacementNamed(context, '/');
  }
}
