import 'package:flutter/material.dart';
import 'package:phonediretory2/product/view_login/view_login.dart';

import '../view_home/view_home.dart';

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
    Navigator.push(context,
        MaterialPageRoute(builder: (BuildContext context) => ViewHome()));
  }

  void goToLogin({required BuildContext context}) {
    Navigator.push(context,
        MaterialPageRoute(builder: (BuildContext context) => ViewLogin()));
  }
}
