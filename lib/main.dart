import 'package:flutter/material.dart';
import 'package:phonediretory2/product/view_home/view_home.dart';
import 'package:phonediretory2/product/view_login/view_login.dart';
import 'package:phonediretory2/product/view_login/vm_login.dart';
import 'package:phonediretory2/product/view_register/vm_register.dart';
import 'package:phonediretory2/shared/colors/uicolors.dart';
import 'package:provider/provider.dart';

import 'product/view_add_user/view_add_user.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => VMLogin()),
        ChangeNotifierProvider(create: (_) => VMRegister()),
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
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "Inter",
        hintColor: UIColors.hintColor,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewLogin();
  }
}
