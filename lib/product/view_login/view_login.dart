import 'package:flutter/material.dart';
import 'package:phonediretory2/product/view_login/vm_login.dart';
import 'package:phonediretory2/shared/asset_paths/image_paths.dart';
import 'package:phonediretory2/shared/fonts/text_styles.dart';
import 'package:phonediretory2/widgets/sign_widgets.dart/sign_button.dart';
import 'package:provider/provider.dart';
import '../../shared/strings/sign_strings.dart';
import '../../widgets/sign_widgets.dart/custom_divider.dart';
import '../../widgets/sign_widgets.dart/custom_text_field.dart';
import '../../widgets/sign_widgets.dart/other_login_buttons.dart';
import '../../widgets/sign_widgets.dart/title.dart';

class ViewLogin extends StatelessWidget {
  const ViewLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: SingleChildScrollView(
            child: SizedBox(
              height: MediaQuery.sizeOf(context).height - 40,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(ImagePaths.logoPath),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .7,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const customTitle(
                          title: SignStrings.loginTitle,
                        ),
                        _Body(),
                        SignButton(
                            onTap: () =>
                                VMLogin().loginButtonFunc(context: context),
                            title: SignStrings.loginButonTitle),
                        CustomDivider(),
                        OtherLogin(),
                      ],
                    ),
                  ),
                  GoToRegisterString(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

final class GoToRegisterString extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text(
          SignStrings.ifYouDontHaveAccounts,
          style: TextStyles.medium,
        ),
        GestureDetector(
          onTap: () => VMLogin().goToRegister(context: context),
          child: Text(
            SignStrings.goToRegister,
            style: TextStyles.medium.copyWith(fontWeight: FontWeight.bold),
          ),
        ),
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
            hintText: SignStrings.emailHintText,
            controller: VMLogin.emailTextEditingController),
        CustomTextField(
            ishowable: true,
            hintText: SignStrings.passwordHintText,
            controller: VMLogin.passwordTextEditingController),
        RememberAndForgotPassword(),
      ],
    );
  }
}

final class RememberAndForgotPassword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        RememberCheckBox(),
        const Spacer(),
        ForgotPassword(),
      ],
    );
  }
}

final class RememberCheckBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.read<VMLogin>().changeRemember(),
      child: Row(
        children: [
          context.watch<VMLogin>().rememberMe
              ? const ImageIcon(AssetImage(ImagePaths.selectedBoxPath))
              : const ImageIcon(AssetImage(ImagePaths.unSelectedBoxPath)),
          const SizedBox(
            width: 5,
          ),
          Text(
            SignStrings.checkboxTitle,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(),
          ),
        ],
      ),
    );
  }
}

final class ForgotPassword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () => VMLogin().showForgotPassword(),
        child: const Text(
          SignStrings.forgotPassword,
          style: TextStyles.small,
        ));
  }
}
