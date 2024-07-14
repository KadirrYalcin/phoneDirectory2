import 'package:flutter/material.dart';
import 'package:phonediretory2/shared/strings/sign_strings.dart';
import 'package:phonediretory2/widgets/sign_widgets.dart/custom_divider.dart';
import 'package:phonediretory2/widgets/sign_widgets.dart/custom_text_field.dart';
import 'package:phonediretory2/product/view_register/vm_register.dart';
import 'package:phonediretory2/shared/asset_paths/image_paths.dart';
import 'package:phonediretory2/widgets/sign_widgets.dart/other_login_buttons.dart';
import '../../shared/fonts/text_styles.dart';
import '../../widgets/sign_widgets.dart/sign_button.dart';
import '../../widgets/sign_widgets.dart/title.dart';

class ViewRegister extends StatelessWidget {
  const ViewRegister({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: SafeArea(
            child: Container(
              height: MediaQuery.sizeOf(context).height - 40,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(ImagePaths.logoPath),
                  SizedBox(
                    height: MediaQuery.sizeOf(context).height * .7,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const customTitle(
                          title: SignStrings.registerTitle,
                        ),
                        _Body(),
                        SignButton(
                          onTap: () =>
                              VMRegister().registerButtonFunc(context: context),
                          title: SignStrings.registerButtonTitle,
                        ),
                        CustomDivider(),
                        OtherLogin()
                      ],
                    ),
                  ),
                  GoToLoginString()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class GoToLoginString extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text(
          SignStrings.ifYouHaveAccounts,
          style: TextStyles.medium,
        ),
        GestureDetector(
          onTap: () => VMRegister().goToLogin(context: context),
          child: Text(SignStrings.goToLogin,
              style: TextStyles.medium.copyWith(fontWeight: FontWeight.bold)),
        )
      ],
    );
  }
}

class _Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextField(
            hintText: SignStrings.nameSurnameHintText,
            controller: TextEditingController()),
        CustomTextField(
            hintText: SignStrings.emailHintText,
            controller: TextEditingController()),
        CustomTextField(
          hintText: SignStrings.passwordHintText,
          controller: TextEditingController(),
          ishowable: true,
        ),
        CustomTextField(
          hintText: SignStrings.passwordAgainHintText,
          controller: TextEditingController(),
          ishowable: true,
        ),
      ],
    );
  }
}
