import 'dart:io';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:phonediretory2/core/models/person_model.dart';
import 'package:phonediretory2/product/view_add_person/view_add_person.dart';
import 'package:phonediretory2/product/view_add_person/vm_add_person.dart';
import 'package:phonediretory2/product/view_detail/view_detail.dart';
import 'package:phonediretory2/product/view_edit_person/view_edit_person.dart';
import 'package:phonediretory2/product/view_edit_person/vm_edit_person.dart';
import 'package:phonediretory2/product/view_home/view_home.dart';
import 'package:phonediretory2/product/view_home/vm_home.dart';
import 'package:phonediretory2/product/view_login/view_login.dart';
import 'package:phonediretory2/product/view_register/view_register.dart';
import 'package:phonediretory2/product/view_register/vm_register.dart';
import 'package:phonediretory2/shared/colors/uicolors.dart';
import 'package:provider/provider.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

late Box personBox;
late final SharedPreferences prefs;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  prefs = await SharedPreferences.getInstance();
  HttpOverrides.global = MyHttpOverrides();
  final appDocumentDir = await getApplicationDocumentsDirectory();
  await Hive.initFlutter(appDocumentDir.path);
  Hive.registerAdapter(PersonAdapter());
  personBox = await Hive.openBox<Person>('personBox');

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => VMRegister()),
        ChangeNotifierProvider(create: (_) => VMAddPerson()),
        ChangeNotifierProvider(create: (_) => VMEditPerson()),
        ChangeNotifierProvider(create: (_) => VMHome()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => const ViewLogin(),
        '/register': (context) => const ViewRegister(),
        '/home': (context) => const ViewHome(),
        '/editPerson': (context) => const ViewEditPerson(),
        '/addPerson': (context) => const ViewAddPerson(),
        '/personDetail': (context) => const ViewPersonDetail(),
      },
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        fontFamily: "Inter",
        hintColor: UIColors.hintColor,
      ),
    );
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
