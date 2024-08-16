import 'package:flutter/material.dart';
import 'package:phonediretory2/core/service/auth_service_functions.dart';
import 'package:phonediretory2/product/view_login/vm_login.dart';
import 'package:phonediretory2/shared/asset_paths/image_paths.dart';
import 'package:phonediretory2/shared/colors/uicolors.dart';
import 'package:phonediretory2/shared/fonts/text_styles.dart';
import '../../shared/strings/strings.dart';
import '../../widgets/custom_blue_button.dart';
import '../../widgets/sign_widgets.dart/custom_divider.dart';
import '../../widgets/custom_text_field.dart';
import '../../widgets/sign_widgets.dart/other_login_buttons.dart';
import '../../widgets/sign_widgets.dart/title.dart';

class ViewLogin extends StatefulWidget {
  const ViewLogin({super.key});

  @override
  State<ViewLogin> createState() => _ViewLoginState();
}

bool loginin = false;

class _ViewLoginState extends State<ViewLogin> {
  void navigateBasedOnLoginStatus(BuildContext context) async {
    loginin = await AuthFunctions.tryRemember(context: context);

    if (loginin) {
      Navigator.pushReplacementNamed(context, '/home');
    }
  }

  @override
  void initState() {
    super.initState();
    navigateBasedOnLoginStatus(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: !loginin
          ? const Center(
              child: CircularProgressIndicator(
              color: UIColors.blue,
            ))
          : Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: SingleChildScrollView(
                child: SizedBox(
                  height: MediaQuery.sizeOf(context).height,
                  child: SafeArea(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(ImagePaths.logoPath),
                        _Body(),
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

class _Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .7,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomTitle(
            title: Strings.loginTitle,
          ),
          _EnterVariable(),
          CustomBlueButton(
              onTap: () => VMLogin.loginButtonFunc(
                    context: context,
                  ),
              title: Strings.loginButonTitle),
          CustomDivider(),
          OtherLogin(),
        ],
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
          Strings.ifYouDontHaveAccounts,
          style: TextStyles.medium,
        ),
        GestureDetector(
          onTap: () => VMLogin.loginButtonFunc(context: context),
          child: Text(
            Strings.goToRegister,
            style: TextStyles.medium.copyWith(fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}

class _EnterVariable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextField(
            keyboardType: TextInputType.emailAddress,
            hintText: Strings.emailHintText,
            controller: VMLogin.emailTextEditingController),
        CustomTextField(
            showable: true,
            hintText: Strings.passwordHintText,
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

final class RememberCheckBox extends StatefulWidget {
  @override
  State<RememberCheckBox> createState() => _RememberCheckBoxState();
}

class _RememberCheckBoxState extends State<RememberCheckBox> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          VMLogin.rememberMe = !VMLogin.rememberMe;
        });
      },
      child: Row(
        children: [
          VMLogin.rememberMe
              ? const ImageIcon(AssetImage(ImagePaths.selectedBoxPath))
              : const ImageIcon(AssetImage(ImagePaths.unSelectedBoxPath)),
          const SizedBox(
            width: 5,
          ),
          Text(
            Strings.checkboxTitle,
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
          Strings.forgotPassword,
          style: TextStyles.small,
        ));
  }
}
