import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:phonediretory2/core/models/request_model.dart/person_request_model/create_person_request_model.dart';
import 'package:phonediretory2/core/service/functions/person_service_functions.dart';
import '../../shared/strings/strings.dart';
import '../../widgets/toast_widget.dart';

class VMAddPerson extends ChangeNotifier {
  String? unClickableReason;
  static TextEditingController nameSurnameController = TextEditingController();
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

  void savePerson(BuildContext context) async {
    if (nameSurnameController.text.isEmpty ||
        nameSurnameController.text == "") {
      unClickableReason = Strings.enterNameSurnameMessage;
    } else if (phoneNumberController.text.isEmpty ||
        phoneNumberController.text == "") {
      unClickableReason = Strings.enterNumberMessage;
    }
    if (unClickableReason != null) {
      showToastMessage(unClickableReason!);
    } else {
      CreatePersonRequestModel createPersonRequestModel =
          CreatePersonRequestModel(
        fullName: nameSurnameController.text,
        emailDetail: emailController.text,
        phoneNumber: [
          phoneNumberController.text,
        ],
        photoUrl:
            image == null ? null : await MultipartFile.fromFile(image!.path),
      );
      try {
        await PersonServiceFunctions().addPerson(createPersonRequestModel);
        // ignore: use_build_context_synchronously
        Navigator.pop(context);
        nameSurnameController.text = "";
        phoneNumberController.text = "";
        oneMorephoneNumberController.text = "";
        emailController.text = "";
        image = null;
      } catch (e) {
        showToastMessage("message");
      }
    }
  }
}
