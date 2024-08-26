import 'package:flutter/material.dart';
import 'package:phonediretory2/core/models/person_model.dart';
import 'package:phonediretory2/core/models/response_model.dart/person_response_model.dart';
import 'package:phonediretory2/core/service/functions/person_service_functions.dart';
import 'pages/list_page.dart';

class VMHome extends ChangeNotifier {
  static final List pages = [
    const Text("1.sayfa"),
    const Text("2.sayfa"),
    ListPage(),
    const Text("4.sayfa"),
    const Text("5.sayfa"),
  ];
  int selectedIndex = 2;
  late List<PersonResponseModel> personList = [];
  List<Person> persons = [];
  VMHome() {
    updatelist();
  }
  updatelist() async {
    personList = await PersonServiceFunctions().getAll();
    if (personList.length > 2) {
      personList.sort((a, b) => a.compareTo(b));
    }

    notifyListeners();
  }

  void goToDetail(context, PersonResponseModel person) {
    Navigator.pushNamed(context, '/personDetail', arguments: person);
  }

  void addPerson(context) {
    Navigator.pushNamed(context, '/addPerson');
  }

  static final PageController pageController = PageController(initialPage: 2);

  void onPageChanged(int index) {
    selectedIndex = index;
    notifyListeners();
  }

  void onItemTapped(int index) {
    VMHome.pageController.jumpToPage(index);
    selectedIndex = index;
    notifyListeners();
  }
}
