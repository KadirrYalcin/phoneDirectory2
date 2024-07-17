import 'package:flutter/material.dart';
import 'package:phonediretory2/product/view_add_user/view_add_user.dart';
import 'package:phonediretory2/product/view_add_user/vm_add_user.dart';
import 'package:phonediretory2/product/view_detail/view_detail.dart';
import 'package:phonediretory2/product/view_edit_user/view_edit_user.dart';
import 'package:phonediretory2/product/view_edit_user/vm_edit_user.dart';
import 'package:phonediretory2/product/view_home/view_home.dart';
import 'package:phonediretory2/product/view_login/view_login.dart';
import 'package:phonediretory2/product/view_login/vm_login.dart';
import 'package:phonediretory2/product/view_register/view_register.dart';
import 'package:phonediretory2/product/view_register/vm_register.dart';
import 'package:phonediretory2/shared/colors/uicolors.dart';
import 'package:provider/provider.dart';
import 'product/view_home/vm_home.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => VMLogin()),
        ChangeNotifierProvider(create: (_) => VMRegister()),
        ChangeNotifierProvider(create: (_) => VMAddUser()),
        ChangeNotifierProvider(create: (_) => VMEditUser()),
        ChangeNotifierProvider(create: (_) => VMHome()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => const ViewLogin(),
        '/register': (context) => const ViewRegister(),
        '/home': (context) => const ViewHome(),
        '/editUser': (context) => const ViewEditUser(),
        '/addUser': (context) => const ViewAddUser(),
        '/userDetail': (context) => const ViewUserDetail(),
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
