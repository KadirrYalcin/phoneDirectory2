import 'package:flutter/material.dart';

import '../../shared/colors/uicolors.dart';
import '../../shared/fonts/text_styles.dart';

final class CustomDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 1,
            color: UIColors.lightGrey,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "Veya",
            style: TextStyles.medium,
          ),
        ),
        Expanded(
          child: Container(
            color: UIColors.lightGrey,
            height: 1,
          ),
        ),
      ],
    );
  }
}
