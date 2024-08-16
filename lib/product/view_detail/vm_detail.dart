import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../core/models/person_model.dart';
import '../../widgets/delete_alert_dialog.dart';

class VMDetail {
  void connectWithMessage() {}
  Future<void> connectWithPhone(String number) async {
    if (await canLaunch(number)) {
      await launch(number);
    } else {
      throw 'Could not launch $number';
    }
  }

  void connectWithVideo() {}
  void connectWithaMail() {}
  void editPerson(BuildContext context, Person person) {
    Navigator.pushNamed(context, "/editPerson", arguments: person);
  }

  void sharePersonData(Person person, BuildContext context) {
    Share.share(
      person.number,
    );
  }

  void deletePerson(Person person, BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return DeleteAlertDialog(person: person);
      },
    );
  }
}
