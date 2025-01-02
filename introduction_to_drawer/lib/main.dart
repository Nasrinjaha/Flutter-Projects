import 'package:flutter/material.dart';
import 'package:introduction_to_drawer/Pages/drawer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: new1(),
    );
  }
}
