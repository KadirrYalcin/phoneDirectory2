import 'package:flutter/material.dart';

import '../../shared/colors/uicolors.dart';
import '../../shared/fonts/text_styles.dart';

final class SignButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const SignButton({super.key, required this.title, required this.onTap});

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
}
