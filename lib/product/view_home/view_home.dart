import 'package:flutter/material.dart';
import 'package:azlistview/azlistview.dart';
import 'package:phonediretory2/product/view_home/vm_home.dart';
import 'package:phonediretory2/shared/asset_paths/image_paths.dart';
import 'package:phonediretory2/shared/colors/uicolors.dart';
import 'package:phonediretory2/shared/strings/home_strings.dart';

class ViewHome extends StatefulWidget {
  const ViewHome({super.key});

  @override
  State<ViewHome> createState() => _ViewHomeState();
}

class _ViewHomeState extends State<ViewHome> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            Image.asset(ImagePaths.logoPath),
            CustomSearchBar(),
            SizedBox(
                height: MediaQuery.sizeOf(context).height * .7,
                child: _ListBody()),
          ],
        ),
      ),
    ));
  }
}

class CustomSearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
        onPressed: () {
          showSearch(context: context, delegate: customSearhDelegate());
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: [Text(HomeStrings.searcBarHintText), Icon(Icons.search)],
        ));
  }
}

class CustomListTle extends StatelessWidget {
  final String Title;
  final String image;

  const CustomListTle({super.key, required this.Title, this.image = ""});
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(Title),
      leading: CircleAvatar(
        backgroundColor: Colors.amber,
        radius: 20,
      ),
    );
  }
}

class _ListBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AzListView(
      indexBarOptions: const IndexBarOptions(
        selectTextStyle: TextStyle(color: Colors.amber),
        indexHintAlignment: Alignment.centerRight,
      ),
      indexHintBuilder: (context, tag) {
        return Container(
          height: 50,
          width: 50,
          child: Center(child: Text(tag)),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16), color: Colors.amber),
        );
      },
      data: VMHome().names,
      itemCount: VMHome().names.length,
      itemBuilder: (context, index) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [Text(VMHome().names[index].name), Divider()],
      ),
    );
  }
}

class customSearhDelegate extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [IconButton(onPressed: () {}, icon: Icon(Icons.clear))];
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
      itemBuilder: (context, index) => ListTile(
        title: Text(matchQuery[index]),
      ),
    );
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

          return ListTile(
            title: Text(result),
          );
        });
  }
}
