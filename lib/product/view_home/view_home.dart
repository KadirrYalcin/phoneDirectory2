import 'package:flutter/material.dart';
import 'package:phonediretory2/product/view_home/vm_home.dart';
import 'package:phonediretory2/shared/asset_paths/icon_paths.dart';
import 'package:phonediretory2/shared/asset_paths/image_paths.dart';
import 'package:phonediretory2/shared/colors/uicolors.dart';
import 'package:phonediretory2/shared/strings/strings.dart';
import 'package:provider/provider.dart';

class ViewHome extends StatelessWidget {
  const ViewHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _Appbar(),
      body: SafeArea(
        child: PageView.builder(
          controller: VMHome.pageController,
          onPageChanged: context.watch<VMHome>().onPageChanged,
          itemCount: VMHome.pages.length,
          itemBuilder: (context, index) => VMHome.pages[index],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: context.watch<VMHome>().selectedIndex,
          selectedItemColor: UIColors.blue,
          unselectedItemColor: UIColors.grey,
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          onTap: VMHome().onItemTapped,
          items: const [
            BottomNavigationBarItem(
                icon: ImageIcon(AssetImage(IconPaths.fastCall)),
                label: Strings.fastCall),
            BottomNavigationBarItem(
                icon: ImageIcon(AssetImage(IconPaths.lastCall)),
                label: Strings.lastCall),
            BottomNavigationBarItem(
                icon: ImageIcon(AssetImage(IconPaths.user)),
                label: Strings.user),
            BottomNavigationBarItem(
                icon: ImageIcon(AssetImage(IconPaths.keyboard)),
                label: Strings.keyboard),
            BottomNavigationBarItem(
                icon: ImageIcon(AssetImage(IconPaths.voiceMessage)),
                label: Strings.voiceMessage)
          ]),
    );
  }
}

class _Appbar extends StatelessWidget implements PreferredSize {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Image.asset(
        ImagePaths.logoPath,
        height: 32,
      ),
      actions: [
        GestureDetector(
          onTap: () => VMHome().addUser(context),
          child: const CircleAvatar(
            radius: 16,
            backgroundColor: UIColors.blue,
            child: ImageIcon(
              AssetImage(IconPaths.userPlusRounded),
              color: UIColors.white,
            ),
          ),
        ),
        const SizedBox(
          width: 20,
        )
      ],
    );
  }

  @override
  Widget get child => throw UnimplementedError();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
