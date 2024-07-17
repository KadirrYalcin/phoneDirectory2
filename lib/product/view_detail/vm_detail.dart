import 'package:flutter/material.dart';
import 'package:phonediretory2/core/models/user_model.dart';

class VMDetail {
  void connectWithMessage() {}
  void connectWithPhone() {}
  void connectWithVideo() {}
  void connectWithaMail() {}
  void editUser(BuildContext context, User user) {
    Navigator.pushNamed(context, "/editUser", arguments: user);
  }
}
