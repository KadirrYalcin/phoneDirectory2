import 'package:flutter/material.dart';
import 'package:phonediretory2/core/models/user_model.dart';

class VMAddUser {
  User? user;
  getUser(User? getUser) {
    if (getUser != null) {
      this.user = getUser;
      nameSrnameController.text = getUser!.name;
      phoneNumberController.text = getUser.phone;
      oneMorephoneNumberController.text = getUser.tag;
      emailController.text = getUser.tag;
    }
  }

  static TextEditingController nameSrnameController = TextEditingController();
  static TextEditingController phoneNumberController = TextEditingController();
  static TextEditingController oneMorephoneNumberController =
      TextEditingController();
  static TextEditingController emailController = TextEditingController();
}
