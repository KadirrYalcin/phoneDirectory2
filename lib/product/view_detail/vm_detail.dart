import 'package:flutter/material.dart';
import 'package:phonediretory2/core/models/user_model.dart';
import 'package:phonediretory2/product/view_add_user/view_add_user.dart';

class VMDetail {
  void connectWithMessage() {}
  void connectWithPhone() {}
  void connectWithVideo() {}
  void connectWithaMail() {}
  void editUser(
    BuildContext context,
  ) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ViewAddUser(
            user: User(name: "name", tag: "tag", phone: "phone"),
          ),
        ));
  }
}
