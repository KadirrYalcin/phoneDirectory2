import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:phonediretory2/core/models/user_model.dart';
import 'package:phonediretory2/shared/strings/strings.dart';

class VMEditUser extends ChangeNotifier {
  User? user;
  getUser(User? getUser) {
    if (getUser != null) {
      user = getUser;
      nameSrnameController.text = getUser.name;
      phoneNumberController.text = getUser.phone;
      oneMorephoneNumberController.text = getUser.tag;
      emailController.text = getUser.tag;
    }
  }

  File? image;
  final ImagePicker _picker = ImagePicker();

  Future<void> pickImage(context) async {
    PermissionStatus status = await Permission.camera.request();
    if (status.isGranted) {
      final XFile? getImage =
          await _picker.pickImage(source: ImageSource.gallery);
      if (getImage != null) {
        image = File(getImage.path);
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text(Strings.galleryAccessDenied)),
      );
    }
    notifyListeners();
  }

  void backHome(context) {
    Navigator.pushNamedAndRemoveUntil(
      context,
      "/home",
      (route) => false, // Tüm sayfaları kaldır
    );
  }

  static TextEditingController nameSrnameController = TextEditingController();
  static TextEditingController phoneNumberController = TextEditingController();
  static TextEditingController oneMorephoneNumberController =
      TextEditingController();
  static TextEditingController emailController = TextEditingController();
}
