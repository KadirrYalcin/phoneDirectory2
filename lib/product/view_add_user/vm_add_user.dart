import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:phonediretory2/core/models/user_model.dart';
import '../../shared/strings/strings.dart';

class VMAddUser extends ChangeNotifier {
  User? user;
  String? unClickableReason;
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
}
