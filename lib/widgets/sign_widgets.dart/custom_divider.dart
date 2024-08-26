import 'package:flutter/material.dart';
import 'package:phonediretory2/shared/strings/strings.dart';

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
            color: UIColors.borderGrey,
          ),
        ),
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            Strings.or,
            style: TextStyles.medium,
          ),
        ),
        Expanded(
          child: Container(
            color: UIColors.borderGrey,
            height: 1,
          ),
        ),
      ],
    );
  }
}
