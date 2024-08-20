import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:phonediretory2/core/models/response_model.dart/person_response_model.dart';
import 'package:phonediretory2/main.dart';
import 'package:phonediretory2/shared/strings/strings.dart';
import 'package:phonediretory2/widgets/toast_widget.dart';
import '../../core/models/person_model.dart';

class VMEditPerson extends ChangeNotifier {
  static PersonResponseModel? person;
  static TextEditingController nameSurnameController = TextEditingController();
  static TextEditingController phoneNumberController = TextEditingController();
  static TextEditingController oneMorephoneNumberController =
      TextEditingController();
  static TextEditingController emailController = TextEditingController();
  static getPerson(PersonResponseModel? person) {
    if (person != null) {
      person = person;
      nameSurnameController.text = person.fullName!;
      phoneNumberController.text = person.phoneNumber![0]!;
      oneMorephoneNumberController.text = person.phoneNumber![1] ?? "";
      emailController.text = person.emailDetail ?? "";
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

  void updatePerson(BuildContext context) {
    List<String> getNames = [];
    for (int i = 0; i < personBox.length; i++) {
      getNames.add(personBox.getAt(i).name);
    }
    if (person!.fullName != nameSurnameController.text &&
        getNames.contains(nameSurnameController.text)) {
      showToastMessage(Strings.nameAlreadyExistsMessage);
    } else {
      personBox.delete(person!.id);

      personBox.put(
        person!.id,
        Person(
            id: person!.id!,
            name: nameSurnameController.text,
            number: phoneNumberController.text,
            email: emailController.text,
            secondNumber: oneMorephoneNumberController.text),
      );
      Navigator.pushReplacementNamed(context, "/home");
    }
  }
}
