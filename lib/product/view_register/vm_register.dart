import 'package:flutter/material.dart';
import 'package:phonediretory2/product/view_login/view_login.dart';

import '../view_home/view_home.dart';

class VMRegister {
  void registerButtonFunc({required BuildContext context}) {
    Navigator.push(context,
        MaterialPageRoute(builder: (BuildContext context) => ViewHome()));
  }

  void goToLogin({required BuildContext context}) {
    Navigator.push(context,
        MaterialPageRoute(builder: (BuildContext context) => ViewLogin()));
  }
}
