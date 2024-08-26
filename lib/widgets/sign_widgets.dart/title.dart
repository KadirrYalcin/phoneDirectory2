import 'package:flutter/material.dart';

import '../../shared/fonts/text_styles.dart';

class CustomTitle extends StatelessWidget {
  final String title;

  const CustomTitle({super.key, required this.title});
  @override
  Widget build(BuildContext context) {
    return Text(title, style: TextStyles.titleBoldLarge);
  }
}
