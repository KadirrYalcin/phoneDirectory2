import 'package:flutter/material.dart';
import 'package:phonediretory2/product/view_add_person/vm_add_person.dart';
import 'package:phonediretory2/shared/asset_paths/icon_paths.dart';
import 'package:phonediretory2/widgets/custom_blue_button.dart';
import 'package:phonediretory2/widgets/custom_text_field.dart';
import 'package:provider/provider.dart';
import '../../shared/colors/uicolors.dart';
import '../../shared/strings/strings.dart';

class ViewAddPerson extends StatelessWidget {
  const ViewAddPerson({
    super.key,
  });

  @override
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
              CustomBlueButton(
                title: Strings.save,
                onTap: () {
                  context.read<VMAddPerson>().savePerson(context);
                },
              ),
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
            controller: VMAddPerson.nameSurnameController),
        CustomTextField(
          hintText: Strings.phoneNumber,
          controller: VMAddPerson.phoneNumberController,
          keyboardType: TextInputType.number,
        ),
        AddNumber(),
        CustomTextField(
          hintText: Strings.emailHintText,
          controller: VMAddPerson.emailController,
          keyboardType: TextInputType.emailAddress,
        ),
      ],
    );
  }
}

final class AddNumber extends StatefulWidget {
  @override
  State<AddNumber> createState() => _AddNumberState();
}

class _AddNumberState extends State<AddNumber> {
  bool addNumber = false;
  @override
  Widget build(BuildContext context) {
    return addNumber
        ? CustomTextField(
            hintText: Strings.phone,
            controller: VMAddPerson.oneMorephoneNumberController,
            keyboardType: TextInputType.number,
          )
        : GestureDetector(
            onTap: () {
              setState(() {
                addNumber = true;
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
                  const SizedBox(
                    width: 8,
                  ),
                  const Text(Strings.addOneMoreNumber),
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
      child: GestureDetector(
        onTap: () {
          context.read<VMAddPerson>().pickImage(context);
        },
        child: Container(
          decoration: BoxDecoration(
              color: UIColors.borderGrey.withOpacity(0.05),
              border: Border.all(width: 2, color: UIColors.borderGrey),
              shape: BoxShape.circle),
          height: 72,
          width: 72,
          child: context.watch<VMAddPerson>().image == null
              ? const ImageIcon(
                  AssetImage(IconPaths.addPhoto),
                  color: Colors.black,
                )
              : ClipOval(
                  child: Image.file(
                    context.watch<VMAddPerson>().image!,
                    fit: BoxFit.cover,
                    height: 72,
                    width: 72,
                  ),
                ),
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
        const Text(Strings.addPersonTitle,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
        const SizedBox(
          width: 32,
        ),
      ],
    );
  }
}
