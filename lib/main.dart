import 'package:flutter/material.dart';
import 'package:flutter_ui_study_bank/home_page.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Bank",
      home: HomePage(),
    );
  }
}