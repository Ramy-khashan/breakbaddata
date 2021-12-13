import 'package:breakbaddata/screens/characters/view.dart';
import 'package:breakbaddata/screens/death/view.dart';
import 'package:breakbaddata/screens/homepage/view.dart';
import 'package:breakbaddata/screens/quotes/view.dart';
import 'package:flutter/material.dart';

import 'screens/episode/view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          appBarTheme: AppBarTheme(
        backgroundColor: Colors.blueGrey.shade900,
        toolbarHeight: 70,
      )),
      debugShowCheckedModeBanner: false,
      home: const HomePageScreen(),
    );
  }
}
