import 'package:flutter/material.dart';
import 'package:themeal/common/contans/string.dart';
import 'package:themeal/home_page.dart';
import 'package:themeal/home_page.dart';

class TheMealApp extends StatelessWidget {
  const TheMealApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: kAppName,
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}