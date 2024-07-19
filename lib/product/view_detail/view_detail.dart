import 'package:flutter/material.dart';
import 'package:phonediretory2/core/models/user_model.dart';
import 'package:phonediretory2/product/view_detail/vm_detail.dart';
import 'package:phonediretory2/shared/asset_paths/icon_paths.dart';
import 'package:phonediretory2/shared/colors/uicolors.dart';
import 'package:phonediretory2/shared/fonts/text_styles.dart';
import 'package:phonediretory2/shared/strings/strings.dart';

import '../../shared/asset_paths/image_paths.dart';

class ViewUserDetail extends StatefulWidget {
  const ViewUserDetail({super.key});

  @override
  State<ViewUserDetail> createState() => _ViewUserDetailState();
}

class _ViewUserDetailState extends State<ViewUserDetail> {
  @override
  Widget build(BuildContext context) {
    final User user = ModalRoute.of(context)!.settings.arguments as User;
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            _TabBar(),
            UserPhotoCard(tag: user.name),
            ConnectionOptions(),
            _Body(
              user: user,
            ),
          ],
        ),
      ),
    ));
  }
}

final class _Body extends StatelessWidget {
  final User user;

  const _Body({required this.user});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * .27,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _BodyButton(
            onTap: () => VMDetail().editUser(context, user),
            iconPath: IconPaths.pen,
            title: Strings.editUser,
          ),
          _BodyButton(
            onTap: () => VMDetail().shareUserData(user, context),
            iconPath: IconPaths.share,
            title: Strings.shareUser,
          ),
          const _BodyButton(
            iconPath: IconPaths.star,
            title: Strings.addFastCall,
          )
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
                AssetImage(iconPath),
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
          onTap: () => VMDetail().connectWithPhone(),
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

final class UserPhotoCard extends StatelessWidget {
  final String tag;

  const UserPhotoCard({super.key, required this.tag});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: Column(
        children: [
          CircleAvatar(
            radius: 36,
            child: Image.asset(
              ImagePaths.userPP,
              fit: BoxFit.cover,
              width: 72,
              height: 72,
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          Text(
            tag,
            style: TextStyles.large,
          ),
          Text(
            "+90 563 33 66",
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
