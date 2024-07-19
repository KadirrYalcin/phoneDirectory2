import 'package:flutter/material.dart';
import 'package:phonediretory2/shared/strings/strings.dart';
import 'package:phonediretory2/widgets/sign_widgets.dart/custom_divider.dart';
import 'package:phonediretory2/widgets/sign_widgets.dart/custom_text_field.dart';
import 'package:phonediretory2/product/view_register/vm_register.dart';
import 'package:phonediretory2/shared/asset_paths/image_paths.dart';
import 'package:phonediretory2/widgets/sign_widgets.dart/other_login_buttons.dart';
import 'package:provider/provider.dart';
import '../../shared/fonts/text_styles.dart';
import '../../widgets/custom_blue_button.dart';
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
            child: SizedBox(
              height: MediaQuery.sizeOf(context).height - 40,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(ImagePaths.logoPath),
                  _Body(),
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

class _Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * .7,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomTitle(
            title: Strings.registerTitle,
          ),
          _BodyTextFields(),
          CustomBlueButton(
            onTap: () => VMRegister().registerButtonFunc(context: context),
            title: Strings.registerButtonTitle,
          ),
          CustomDivider(),
          OtherLogin()
        ],
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
          Strings.ifYouHaveAccounts,
          style: TextStyles.medium,
        ),
        GestureDetector(
          onTap: () => VMRegister().goToLogin(context: context),
          child: Text(Strings.goToLogin,
              style: TextStyles.medium.copyWith(fontWeight: FontWeight.bold)),
        )
      ],
    );
  }
}

class _BodyTextFields extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextField(
            hintText: Strings.nameSurnameHintText,
            controller: VMRegister.nameTextEditingController),
        CustomTextField(
            hintText: Strings.emailHintText,
            controller: VMRegister.emailTextEditingController),
        CustomTextField(
          hintText: Strings.passwordHintText,
          controller: VMRegister.passwordTextEditingController,
          showable: true,
        ),
        CustomTextField(
          hintText: Strings.passwordAgainHintText,
          controller: VMRegister.passwordAgainTextEditingController,
          showable: true,
        ),
      ],
    );
  }
}
