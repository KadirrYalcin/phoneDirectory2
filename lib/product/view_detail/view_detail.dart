import 'package:flutter/material.dart';
import 'package:phonediretory2/core/models/response_model.dart/person_response_model.dart';
import 'package:phonediretory2/product/view_detail/vm_detail.dart';
import 'package:phonediretory2/shared/asset_paths/icon_paths.dart';
import 'package:phonediretory2/shared/colors/uicolors.dart';
import 'package:phonediretory2/shared/fonts/text_styles.dart';
import 'package:phonediretory2/shared/strings/strings.dart';
import 'package:phonediretory2/widgets/person_photo_circle.dart';

class ViewPersonDetail extends StatefulWidget {
  const ViewPersonDetail({super.key});

  @override
  State<ViewPersonDetail> createState() => _ViewPersonDetailState();
}

class _ViewPersonDetailState extends State<ViewPersonDetail> {
  @override
  Widget build(BuildContext context) {
    final PersonResponseModel person =
        ModalRoute.of(context)!.settings.arguments as PersonResponseModel;

    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            _TabBar(),
            PersonPhotoCard(person: person),
            ConnectionOptions(
              person: person,
            ),
            _Body(
              person: person,
            ),
          ],
        ),
      ),
    ));
  }
}

final class _Body extends StatelessWidget {
  final PersonResponseModel person;

  const _Body({required this.person});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * .09 * 4,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _BodyButton(
            onTap: () => VMDetail().editPerson(context, person),
            iconPath: IconPaths.pen,
            title: Strings.editPerson,
          ),
          _BodyButton(
            onTap: () => VMDetail().sharePersonData(person, context),
            iconPath: IconPaths.share,
            title: Strings.sharePerson,
          ),
          const _BodyButton(
            iconPath: IconPaths.star,
            title: Strings.addFastCall,
          ),
          _BodyButton(
            onTap: () => VMDetail().deletePerson(person, context),
            iconPath: IconPaths.delete,
            title: Strings.deletePerson,
          ),
        ],
      ),
    );
  }
}

final class _BodyButton extends StatelessWidget {
  final String iconPath;
  final String title;
  final VoidCallback? onTap;

  const _BodyButton({required this.iconPath, required this.title, this.onTap});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          height: MediaQuery.sizeOf(context).height * .07,
          padding: const EdgeInsets.only(left: 12),
          decoration: BoxDecoration(
              border: Border.all(color: UIColors.borderGrey),
              borderRadius: BorderRadius.circular(16)),
          child: Row(
            children: [
              ImageIcon(
                AssetImage(
                  iconPath,
                ),
                size: 22,
              ),
              const SizedBox(
                width: 5,
              ),
              Text(title)
            ],
          )),
    );
  }
}

final class ConnectionOptions extends StatelessWidget {
  final PersonResponseModel person;

  const ConnectionOptions({super.key, required this.person});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ContactCard(
          imagePath: IconPaths.chatRoundline,
          onTap: () => VMDetail().connectWithMessage(),
          title: Strings.message,
        ),
        ContactCard(
          imagePath: IconPaths.phoneCallingRounded,
          onTap: () => VMDetail().connectWithPhone(person.phoneNumber![0]!),
          title: Strings.phone,
        ),
        ContactCard(
          imagePath: IconPaths.videoCamera,
          onTap: () => VMDetail().connectWithVideo(),
          title: Strings.video,
        ),
        ContactCard(
          imagePath: IconPaths.letter,
          onTap: () => VMDetail().connectWithVideo(),
          title: Strings.letter,
        ),
      ],
    );
  }
}

final class ContactCard extends StatelessWidget {
  final VoidCallback onTap;
  final String imagePath;
  final String title;

  const ContactCard(
      {super.key,
      required this.onTap,
      required this.imagePath,
      required this.title});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: MediaQuery.sizeOf(context).width * .2,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(width: 2, color: UIColors.borderGrey)),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: Column(
            children: [
              ImageIcon(AssetImage(imagePath)),
              Text(
                title,
                style: TextStyles.small,
              )
            ],
          ),
        ),
      ),
    );
  }
}

final class PersonPhotoCard extends StatelessWidget {
  final PersonResponseModel person;

  const PersonPhotoCard({super.key, required this.person});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: Column(
        children: [
          CircleAvatar(
            radius: 36,
            child: person.photoUrl == null
                ? null
                : PersonPhotoCircle(photoUrl: person.photoUrl!, radius: 72),
          ),
          const SizedBox(
            height: 12,
          ),
          Text(
            person.fullName!,
            style: TextStyles.large,
          ),
          Text(
            person.phoneNumber![0]!,
            style: TextStyles.small.copyWith(color: const Color(0xFF646464)),
          )
        ],
      ),
    );
  }
}

class _TabBar extends StatelessWidget {
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
        const Text(Strings.detailTitle,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
        const SizedBox(
          width: 32,
        ),
      ],
    );
  }
}
