import 'package:flutter/material.dart';
import 'package:phonediretory2/core/sign_func.dart';
import 'package:phonediretory2/shared/colors/uicolors.dart';

import '../../shared/asset_paths/image_paths.dart';
import '../../shared/fonts/text_styles.dart';
import '../../shared/strings/sign_strings.dart';

final class OtherLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        LoginWithOtherButton(
          imagePath: ImagePaths.googlePath,
          onTap: () => SignFunc.loginWithGoogle(),
          title: SignStrings.loginWithGoogle,
        ),
        const SizedBox(
          height: 12,
        ),
        LoginWithOtherButton(
          imagePath: ImagePaths.facebookPath,
          onTap: () => SignFunc.loginWithFacebook(),
          title: SignStrings.loginWithFacebook,
        ),
      ],
    );
  }
}

class LoginWithOtherButton extends StatelessWidget {
  final String imagePath;
  final String title;
  final VoidCallback onTap;

  const LoginWithOtherButton(
      {super.key,
      required this.imagePath,
      required this.title,
      required this.onTap});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * .07,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          side: BorderSide(
            color: UIColors.lightGrey,
          ),
        ),
        onPressed: () => onTap(),
        child: Center(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(imagePath),
              const SizedBox(width: 8),
              Text(
                title,
                style: TextStyles.medium,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
