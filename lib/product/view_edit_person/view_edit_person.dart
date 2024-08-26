import 'package:flutter/material.dart';
import 'package:phonediretory2/core/models/response_model.dart/person_response_model.dart';
import 'package:phonediretory2/shared/asset_paths/icon_paths.dart';
import 'package:phonediretory2/widgets/custom_blue_button.dart';
import 'package:phonediretory2/widgets/custom_text_field.dart';
import 'package:phonediretory2/widgets/person_photo_circle.dart';
import 'package:provider/provider.dart';
import '../../shared/colors/uicolors.dart';
import '../../shared/strings/strings.dart';
import 'vm_edit_person.dart';

class ViewEditPerson extends StatelessWidget {
  const ViewEditPerson({super.key});

  @override
  Widget build(BuildContext context) {
    final PersonResponseModel person =
        ModalRoute.of(context)!.settings.arguments as PersonResponseModel;
    VMEditPerson vmEditPerson = VMEditPerson();
    vmEditPerson.getPerson(person);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              _TabBar(),
              AddPhoto(vmEditPerson),
              _Body(vmEditPerson),
              const Spacer(),
              CustomBlueButton(
                  title: Strings.save,
                  onTap: () {
                    vmEditPerson.updatePerson(context);
                  }),
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
  final VMEditPerson vmEditPerson;
  const _Body(this.vmEditPerson);
  @override
  Widget build(
    BuildContext context,
  ) {
    return Column(
      children: [
        CustomTextField(
            hintText: Strings.nameSurnameHintText,
            controller: vmEditPerson.nameSurnameController),
        CustomTextField(
          hintText: Strings.phoneNumber,
          controller: vmEditPerson.phoneNumberController,
          keyboardType: TextInputType.number,
        ),
        vmEditPerson.person.phoneNumber!.length < 2
            ? AddNumber(vmEditPerson)
            : CustomTextField(
                hintText: Strings.phoneNumber,
                controller: vmEditPerson.oneMorephoneNumberController,
                keyboardType: TextInputType.number,
              ),
        CustomTextField(
          hintText: Strings.emailHintText,
          controller: vmEditPerson.emailController,
          keyboardType: TextInputType.emailAddress,
        ),
      ],
    );
  }
}

class AddNumber extends StatefulWidget {
  final VMEditPerson vmEditPerson;
  const AddNumber(this.vmEditPerson, {super.key});
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
            controller: widget.vmEditPerson.oneMorephoneNumberController)
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

final class AddPhoto extends StatefulWidget {
  final VMEditPerson vmEditPerson;
  const AddPhoto(this.vmEditPerson, {super.key});

  @override
  State<AddPhoto> createState() => _AddPhotoState();
}

class _AddPhotoState extends State<AddPhoto> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: GestureDetector(
        onTap: () {
          widget.vmEditPerson.pickImage(context).then(
            (value) {
              setState(() {});
            },
          );
        },
        child: CircleAvatar(
            backgroundColor: UIColors.borderGrey,
            radius: 36,
            child: widget.vmEditPerson.person.photoUrl == null
                ? const ImageIcon(
                    AssetImage(IconPaths.addPhoto),
                    color: Colors.black,
                  )
                : widget.vmEditPerson.image == null
                    ? PersonPhotoCircle(
                        photoUrl: widget.vmEditPerson.person.photoUrl!,
                        radius: 72,
                      )
                    : ClipOval(
                        child: Image.file(
                          fit: BoxFit.cover,
                          height: 72,
                          width: 72,
                          widget.vmEditPerson.image!,
                        ),
                      )),
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
        const Text(Strings.editPerson,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
        const SizedBox(
          width: 32,
        ),
      ],
    );
  }
}
