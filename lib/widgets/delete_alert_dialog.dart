import 'package:flutter/material.dart';

import '../core/models/person_model.dart';
import '../main.dart';
import '../shared/colors/uicolors.dart';
import '../shared/fonts/text_styles.dart';
import '../shared/strings/strings.dart';

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
