import 'package:azlistview/azlistview.dart';
import 'package:flutter/material.dart';
import 'package:phonediretory2/core/models/person_model.dart';
import '../../../shared/asset_paths/icon_paths.dart';
import '../../../shared/colors/uicolors.dart';
import '../../../shared/fonts/text_styles.dart';
import '../../../shared/strings/strings.dart';
import '../vm_home.dart';

final class ListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 16),
          CustomSearchBar(),
          const SizedBox(height: 20),
          _BodyList(),
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
            showSearch(context: context, delegate: CustomSearhDelegate());
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
  final Person person;

  const CustomListTle({super.key, required this.person});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 30,
          child: GestureDetector(
            onTap: () => VMHome().goToDetail(context, person),
            child: Row(
              children: [
                const CircleAvatar(
                  backgroundColor: Colors.amber,
                ),
                Text(person.name),
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
      height: MediaQuery.sizeOf(context).height * .72,
      child: AzListView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        indexBarOptions: const IndexBarOptions(
          indexHintAlignment: Alignment.centerLeft,
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
        data: VMHome().persons,
        itemCount: VMHome().persons.length,
        itemBuilder: (context, index) => CustomListTle(
          person: VMHome().persons[index],
        ),
      ),
    );
  }
}

final class CustomSearhDelegate extends SearchDelegate {
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
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    List<Person> matchQuery = [];
    for (var name in VMHome().persons) {
      if (name.name.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(name);
      }
    }
    return ListView.builder(
        itemCount: matchQuery.length,
        itemBuilder: (context, index) => CustomListTle(
              person: matchQuery[index],
            ));
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<Person> matchQuery = [];
    for (var name in VMHome().persons) {
      if (name.name.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(name);
      }
    }
    return ListView.builder(
        itemCount: matchQuery.length,
        itemBuilder: (context, index) {
          var result = matchQuery[index];

          return CustomListTle(
            person: result,
          );
        });
  }
}
