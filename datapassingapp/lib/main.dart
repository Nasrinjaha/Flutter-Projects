//import 'package:datapassingapp/Pages/formvalidation.dart';
import 'package:flutter/material.dart';
import 'package:datapassingapp/pages/Screen1.dart';
import 'package:datapassingapp/pages/Screen2.dart';
import 'package:datapassingapp/pages/Screen3.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',  // Default route
      routes: {
        '/': (context) => const Screen1(),
        '/second': (context) => const Screen2(titletext: 'Nasrin Jahan Ripa'),  // Pass a title
        '/third': (context) => const Screen3(argument: 'this is third page'),
      },
    );
  }
}
