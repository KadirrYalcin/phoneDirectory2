import 'package:azlistview/azlistview.dart';
import 'package:flutter/material.dart';
import 'package:phonediretory2/core/models/response_model.dart/person_response_model.dart';
import 'package:phonediretory2/core/service/client/rest_client.dart';
import 'package:provider/provider.dart';
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
            //  showSearch(context: context, delegate: CustomSearhDelegate());
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
  final PersonResponseModel person;

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
                CircleAvatar(
                  child: person.photoUrl == null
                      ? SizedBox()
                      : ClipOval(
                          child: Image.network(
                            height: 30,
                            width: 30,
                            fit: BoxFit.cover,
                            servicePhotoUrl + person.photoUrl!,
                          ),
                        ),
                  backgroundColor: UIColors.lightBlue,
                ),
                Text(person.fullName ?? "UnNamed"),
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
        data: context.watch<VMHome>().personList,
        itemCount: context.watch<VMHome>().personList.length,
        itemBuilder: (context, index) => CustomListTle(
          person: context.watch<VMHome>().personList[index],
        ),
      ),
    );
  }
}

// final class CustomSearhDelegate extends SearchDelegate {
//   @override
//   List<Widget>? buildActions(BuildContext context) {
//     return [
//       IconButton(
//           onPressed: () {
//             query = "";
//           },
//           icon: const Icon(Icons.clear))
//     ];
//   }

//   @override
//   Widget? buildLeading(BuildContext context) {
//     return IconButton(
//       icon: const Icon(Icons.arrow_back),
//       onPressed: () {
//         close(context, null);
//       },
//     );
//   }

//   @override
//   Widget buildResults(BuildContext context) {
//     List<PersonResponseModel> matchQuery = [];
//     for (var person in VMHome().personList) {
//       if (person.fullName!.toLowerCase().contains(query.toLowerCase())) {
//         matchQuery.add(person);
//       }
//     }
//     return ListView.builder(
//         itemCount: matchQuery.length,
//         itemBuilder: (context, index) => CustomListTle(
//               person: matchQuery[index],
//             ));
//   }

//   @override
//   Widget buildSuggestions(BuildContext context) {
//     List<PersonResponseModel> matchQuery = [];
//     for (var person in VMHome().personList) {
//       if (person.fullName!.toLowerCase().contains(query.toLowerCase())) {
//         matchQuery.add(person);
//       }
//     }
//     return ListView.builder(
//         itemCount: matchQuery.length,
//         itemBuilder: (context, index) {
//           var result = matchQuery[index];

//           return CustomListTle(
//             person: result,
//           );
//         });
//   }
// }
