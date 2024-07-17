import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:phonediretory2/core/models/user_model.dart';
import '../../shared/strings/strings.dart';

class VMAddUser extends ChangeNotifier {
  User? user;
  bool isClickalbe = false;
  static TextEditingController nameSrnameController = TextEditingController();
  static TextEditingController phoneNumberController = TextEditingController();
  static TextEditingController oneMorephoneNumberController =
      TextEditingController();
  static TextEditingController emailController = TextEditingController();
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

  VMAddUser() {
    nameSrnameController.addListener(() {
      changeClickable();
    });
    phoneNumberController.addListener(() {
      changeClickable();
    });

    emailController.addListener(() {
      changeClickable();
    });
  }
  void changeClickable() {
    if (nameSrnameController.text.isNotEmpty &&
        phoneNumberController.text.isNotEmpty &&
        emailController.text.isNotEmpty) {
      isClickalbe = true;
    } else {
      isClickalbe = false;
    }
    notifyListeners();
  }
}
