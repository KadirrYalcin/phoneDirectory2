import 'package:flutter/material.dart';
import 'package:phonediretory2/core/models/response_model.dart/person_response_model.dart';
import 'package:phonediretory2/core/service/functions/person_service_functions.dart';
import 'package:phonediretory2/widgets/toast_widget.dart';

import '../core/models/person_model.dart';
import '../main.dart';
import '../shared/colors/uicolors.dart';
import '../shared/fonts/text_styles.dart';
import '../shared/strings/strings.dart';

class DeleteAlertDialog extends StatelessWidget {
  final PersonResponseModel person;
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
            Navigator.of(context).pop();
          },
          child: Text(
            Strings.dontDeletePersonButtonTittle,
            style: TextStyles.small.copyWith(color: Colors.green),
          ),
        ),
        TextButton(
          onPressed: () async {
            try {
              await PersonServiceFunctions().deletePerson(person.id!);

              Navigator.pushReplacementNamed(context, "/home");
            } catch (e) {
              showToastMessage("Kişi silme bşarısıız");
            }
          },
          child: Text(Strings.deletePersonButtonTittle,
              style: TextStyles.small.copyWith(color: UIColors.borderRed)),
        ),
      ],
    );
  }
}
