import 'package:flutter/material.dart';

import '../../shared/colors/uicolors.dart';
import '../../shared/fonts/text_styles.dart';

final class CustomBlueButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  final bool clickable;
  CustomBlueButton(
      {super.key,
      required this.title,
      required this.onTap,
      this.clickable = true});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: clickable ? onTap : null,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            color: clickable ? UIColors.blue : UIColors.lightBlue,
            borderRadius: BorderRadius.circular(16)),
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
}
