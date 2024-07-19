import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../shared/colors/uicolors.dart';
import '../../shared/fonts/text_styles.dart';

final class CustomBlueButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const CustomBlueButton({
    super.key,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            color: UIColors.blue, borderRadius: BorderRadius.circular(16)),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Center(
              child: Text(
            title,
            style: TextStyles.whiteButtonLarge,
          )),
        ),
      ),
    );
  }

  void showToastMessage(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.TOP,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.black,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }
}
