import 'package:flutter/material.dart';
import 'package:taller2s2/page/home-page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Calculadora",
      theme: ThemeData.light(),
      home: HomePage(),
    );
  }
}
