import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:phonediretory2/core/models/request_model.dart/person_request_model/update_person_request_model.dart';
import 'package:phonediretory2/core/models/response_model.dart/person_response_model.dart';
import 'package:phonediretory2/core/service/functions/person_service_functions.dart';
import 'package:phonediretory2/shared/strings/strings.dart';
import 'package:phonediretory2/widgets/toast_widget.dart';
import 'package:provider/provider.dart';

class VMEditPerson extends ChangeNotifier {
  late PersonResponseModel person;
  TextEditingController nameSurnameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController oneMorephoneNumberController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  String? unClickableReason;
  getPerson(PersonResponseModel responsePerson) {
    person = responsePerson;
    nameSurnameController.text = responsePerson.fullName!;
    phoneNumberController.text = responsePerson.phoneNumber![0]!;
    oneMorephoneNumberController.text = responsePerson.phoneNumber!.length > 1
        ? responsePerson.phoneNumber![1]!
        : "";
    emailController.text = responsePerson.emailDetail ?? "";
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

  void updatePerson(BuildContext context) async {
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
      UpdatePersonRequestModel updatePersonRequestModel =
          oneMorephoneNumberController.text == ""
              ? UpdatePersonRequestModel(
                  fullName: nameSurnameController.text,
                  phoneNumber: [
                    phoneNumberController.text,
                  ],
                  emailDetail: emailController.text,
                  photoUrl: image == null
                      ? null
                      : await MultipartFile.fromFile(image!.path),
                )
              : UpdatePersonRequestModel(
                  fullName: nameSurnameController.text,
                  phoneNumber: [
                    phoneNumberController.text,
                    oneMorephoneNumberController.text
                  ],
                  emailDetail: emailController.text,
                  // ignore: use_build_context_synchronously
                  photoUrl: image == null
                      ? null
                      : await MultipartFile.fromFile(image!.path),
                );
      await PersonServiceFunctions()
          .updatePerson(person.id!, updatePersonRequestModel);
      // ignore: use_build_context_synchronously
      Navigator.popAndPushNamed(context, "/home");
    }
  }
}
