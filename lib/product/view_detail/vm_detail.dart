import 'package:flutter/material.dart';
import 'package:phonediretory2/main.dart';
import 'package:phonediretory2/shared/colors/uicolors.dart';
import 'package:phonediretory2/shared/strings/strings.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../core/models/person_model.dart';
import '../../shared/fonts/text_styles.dart';

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
    Navigator.pushNamed(context, "/editUser", arguments: person);
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

class DeleteAlertDialog extends StatelessWidget {
  final Person person;
  const DeleteAlertDialog({super.key, required this.person});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      title: const Text(Strings.wawning),
      content: const Text(
        Strings.deletePersonTitle,
        style: TextStyles.medium,
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(); // Close the dialog
          },
          child: Text(
            Strings.dontDeletePersonButtonTittle,
            style: TextStyles.small.copyWith(color: Colors.green),
          ),
        ),
        TextButton(
          onPressed: () {
            personBox.delete(person.id);
            Navigator.pushReplacementNamed(
                context, "/home"); // Close the dialog
          },
          child: Text(Strings.deletePersonButtonTittle,
              style: TextStyles.small.copyWith(color: UIColors.borderRed)),
        ),
      ],
    );
  }
}
