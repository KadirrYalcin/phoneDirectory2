import 'package:flutter/material.dart';

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

  void registerButtonFunc({required BuildContext context}) {
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
    }
    if (unClickableReason != null) {
      showToastMessage(unClickableReason!);
    } else {
      Navigator.pushReplacementNamed(context, '/home');
    }
  }

  void goToLogin({required BuildContext context}) {
    Navigator.pushReplacementNamed(context, '/');
  }
}
