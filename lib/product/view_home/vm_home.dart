import 'package:flutter/material.dart';
import 'package:phonediretory2/core/models/person_model.dart';
import 'package:phonediretory2/main.dart';
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
  List<Person> persons = [];
  VMHome() {
    for (int index = 0; index < personBox.length; index++) {
      persons.add(personBox.getAt(index));
    }
    persons.sort((a, b) => a.compareTo(b));
  }
  updatelist() {
    persons.clear();
    for (int index = 0; index < personBox.length; index++) {
      persons.add(personBox.getAt(index));
    }
    persons.sort((a, b) => a.compareTo(b));
    notifyListeners();
  }

  void goToDetail(context, Person person) {
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
