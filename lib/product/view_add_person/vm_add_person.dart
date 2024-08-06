import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:phonediretory2/core/models/person_model.dart';
import 'package:phonediretory2/main.dart';
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

  void savePerson(BuildContext context) {
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
      prefs.setInt("totalPerson", ((prefs.getInt('totalPerson') ?? 0) + 1));
      Person person = Person(
          id: prefs.getInt("totalPerson")!,
          name: VMAddPerson.nameSurnameController.text,
          number: VMAddPerson.phoneNumberController.text,
          secondNumber: VMAddPerson.oneMorephoneNumberController.text,
          email: VMAddPerson.emailController.text);
      nameSurnameController.text = "";
      phoneNumberController.text = "";
      oneMorephoneNumberController.text = "";
      emailController.text = "";
      personBox.put(person.id, person);
      Navigator.pushReplacementNamed(context, "/home");
    }
  }
}
