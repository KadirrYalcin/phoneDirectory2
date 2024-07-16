import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:phonediretory2/product/view_add_user/vm_add_user.dart';
import 'package:phonediretory2/shared/asset_paths/icon_paths.dart';
import 'package:phonediretory2/widgets/custom_blue_button.dart';
import 'package:phonediretory2/widgets/sign_widgets.dart/custom_text_field.dart';

import '../../core/models/user_model.dart';
import '../../shared/colors/uicolors.dart';
import '../../shared/strings/strings.dart';

class ViewAddUser extends StatefulWidget {
  final User? user;
  const ViewAddUser({super.key, this.user});

  @override
  State<ViewAddUser> createState() => _ViewAddUserState();
}

class _ViewAddUserState extends State<ViewAddUser> {
  final VMAddUser _vmAddUser = VMAddUser();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _vmAddUser.getUser(widget.user);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              _TabBar(),
              AddPhoto(),
              _Body(),
              const Spacer(),
              CustomBlueButton(title: Strings.save, onTap: () {}),
              const SizedBox(
                height: 40,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextField(
            hintText: Strings.nameSurnameHintText,
            controller: VMAddUser.nameSrnameController),
        CustomTextField(
            hintText: Strings.phoneNumber,
            controller: VMAddUser.phoneNumberController),
        AddNumber(),
        CustomTextField(
            hintText: Strings.emailHintText,
            controller: VMAddUser.emailController),
      ],
    );
  }
}

class AddNumber extends StatefulWidget {
  @override
  State<AddNumber> createState() => _AddNumberState();
}

class _AddNumberState extends State<AddNumber> {
  bool AddNumber = false;
  @override
  Widget build(BuildContext context) {
    return AddNumber
        ? CustomTextField(
            hintText: Strings.phone,
            controller: VMAddUser.oneMorephoneNumberController)
        : GestureDetector(
            onTap: () {
              setState(() {
                AddNumber = true;
              });
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Container(
                    width: 20,
                    decoration: BoxDecoration(
                        border: Border.all(width: 2, color: Colors.black),
                        shape: BoxShape.circle),
                    child: const Icon(
                      Icons.add,
                      size: 16,
                    ),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Text(Strings.addOneMoreNumber),
                ],
              ),
            ),
          );
  }
}

final class AddPhoto extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: CircleAvatar(
        backgroundColor: UIColors.borderGrey,
        radius: 36,
        child: const ImageIcon(
          AssetImage(IconPaths.addPhoto),
          color: Colors.black,
        ),
      ),
    );
  }
}

final class _TabBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                    color: UIColors.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 2,
                          offset: const Offset(0, 1),
                          color: Colors.black.withOpacity(0.10)),
                      BoxShadow(
                          blurRadius: 4,
                          offset: const Offset(0, 4),
                          color: Colors.black.withOpacity(0.10))
                    ]),
                child: const Icon(Icons.arrow_back_ios_new, size: 20))),
        const Text(Strings.addUserTitle,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
        const SizedBox(
          width: 32,
        ),
      ],
    );
  }
}
