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
    context.watch<VMHome>().updatelist();
    return Scaffold(
      appBar: _Appbar(),
      body: SafeArea(
        child: Column(
          children: [_PageBuilder(), _BotttomNavDivider()],
        ),
      ),
      bottomNavigationBar: _BottomNavBar(),
    );
  }
}

final class _BottomNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        currentIndex: context.watch<VMHome>().selectedIndex,
        selectedItemColor: UIColors.blue,
        unselectedItemColor: UIColors.grey,
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        onTap: context.read<VMHome>().onItemTapped,
        items: const [
          BottomNavigationBarItem(
              icon: ImageIcon(AssetImage(IconPaths.fastCall)),
              label: Strings.fastCall),
          BottomNavigationBarItem(
              icon: ImageIcon(AssetImage(IconPaths.lastCall)),
              label: Strings.lastCall),
          BottomNavigationBarItem(
              icon: ImageIcon(AssetImage(IconPaths.person)),
              label: Strings.person),
          BottomNavigationBarItem(
              icon: ImageIcon(AssetImage(IconPaths.keyboard)),
              label: Strings.keyboard),
          BottomNavigationBarItem(
              icon: ImageIcon(AssetImage(IconPaths.voiceMessage)),
              label: Strings.voiceMessage)
        ]);
  }
}

final class _BotttomNavDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 2,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(5, (index) {
          return Expanded(
            child: Container(
              color: context.watch<VMHome>().selectedIndex == index
                  ? UIColors.blue
                  : UIColors.borderGrey,
            ),
          );
        }),
      ),
    );
  }
}

final class _PageBuilder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: PageView.builder(
        controller: VMHome.pageController,
        onPageChanged: context.watch<VMHome>().onPageChanged,
        itemCount: VMHome.pages.length,
        itemBuilder: (context, index) => VMHome.pages[index],
      ),
    );
  }
}

final class _Appbar extends StatelessWidget implements PreferredSize {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Image.asset(
        ImagePaths.logoPath,
        height: 32,
      ),
      actions: [
        GestureDetector(
          onTap: () => VMHome().addPerson(context),
          child: const CircleAvatar(
            radius: 16,
            backgroundColor: UIColors.blue,
            child: ImageIcon(
              AssetImage(IconPaths.personPlusRounded),
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
