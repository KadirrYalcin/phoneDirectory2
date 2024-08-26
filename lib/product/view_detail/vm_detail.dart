import 'package:flutter/material.dart';
import 'package:phonediretory2/core/models/response_model.dart/person_response_model.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../widgets/delete_alert_dialog.dart';

class VMDetail {
  void connectWithMessage() {}
  Future<void> connectWithPhone(String number) async {
    // ignore: deprecated_member_use
    if (await canLaunch(number)) {
      // ignore: deprecated_member_use
      await launch(number);
    } else {
      throw 'Could not launch $number';
    }
  }

  void connectWithVideo() {}
  void connectWithaMail() {}
  void editPerson(BuildContext context, PersonResponseModel person) {
    Navigator.pushNamed(context, "/editPerson", arguments: person);
  }

  void sharePersonData(PersonResponseModel person, BuildContext context) {
    Share.share(
      person.phoneNumber![0]!,
    );
  }

  void deletePerson(PersonResponseModel person, BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return DeleteAlertDialog(person: person);
      },
    );
  }
}
