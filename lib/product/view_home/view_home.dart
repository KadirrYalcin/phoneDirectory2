import 'package:flutter/material.dart';
import 'package:azlistview/azlistview.dart';
import 'package:flutter/widgets.dart';
import 'package:phonediretory2/product/view_home/vm_home.dart';
import 'package:phonediretory2/shared/asset_paths/icon_paths.dart';
import 'package:phonediretory2/shared/asset_paths/image_paths.dart';
import 'package:phonediretory2/shared/colors/uicolors.dart';
import 'package:phonediretory2/shared/fonts/text_styles.dart';
import 'package:phonediretory2/shared/strings/strings.dart';

class ViewHome extends StatelessWidget {
  const ViewHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            _TabBar(),
            const SizedBox(height: 16),
            CustomSearchBar(),
            const SizedBox(height: 20),
            _BodyList(),
          ],
        ),
      ),
    ));
  }
}

class _TabBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            ImagePaths.logoPath,
            height: 32,
          ),
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
          )
        ],
      ),
    );
  }
}

final class CustomSearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: GestureDetector(
          onTap: () {
            showSearch(context: context, delegate: customSearhDelegate());
          },
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: UIColors.borderGrey, width: 2)),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    Strings.searcBarHintText,
                    style: TextStyles.large
                        .copyWith(color: Colors.black.withOpacity(0.32)),
                  ),
                  const ImageIcon(AssetImage(IconPaths.magnifier))
                ],
              ),
            ),
          )),
    );
  }
}

final class CustomListTle extends StatelessWidget {
  final String title;
  final String image;

  const CustomListTle({super.key, required this.title, this.image = ""});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 30,
          child: GestureDetector(
            onTap: () => VMHome().goToDetail(context, title),
            child: Row(
              children: [
                const CircleAvatar(
                  backgroundColor: Colors.amber,
                ),
                Text(title),
              ],
            ),
          ),
        ),
        const Divider()
      ],
    );
  }
}

final class _BodyList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * .7,
      child: AzListView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        indexBarOptions: const IndexBarOptions(
          indexHintAlignment: Alignment.centerRight,
        ),
        indexHintBuilder: (context, tag) {
          return Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16), color: UIColors.blue),
            child: Center(
                child: Text(
              tag,
              style: const TextStyle(color: Colors.white),
            )),
          );
        },
        data: VMHome().names,
        itemCount: VMHome().names.length,
        itemBuilder: (context, index) => CustomListTle(
          title: VMHome().names[index].name,
          image: "",
        ),
      ),
    );
  }
}

final class customSearhDelegate extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = "";
          },
          icon: const Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    List<String> matchQuery = [];
    for (var name in VMHome().names) {
      if (name.name.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(name.name);
      }
    }
    return ListView.builder(
        itemCount: matchQuery.length,
        itemBuilder: (context, index) => CustomListTle(
              title: matchQuery[index],
              image: "",
            ));
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery = [];
    for (var name in VMHome().names) {
      if (name.name.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(name.name);
      }
    }
    return ListView.builder(
        itemCount: matchQuery.length,
        itemBuilder: (context, index) {
          var result = matchQuery[index];

          return CustomListTle(
            title: result,
            image: "",
          );
        });
  }
}
