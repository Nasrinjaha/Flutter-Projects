import 'package:flutter/material.dart';
import 'Pages/calculator.dart';

void main() {
  runApp(MyApp());  // Set MyApp as the root widget
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Return the main application widget
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CgpaCalculatorApp(),  // Call the existing CgpaCalculatorApp widget here
    );
  }
}

class CgpaCalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CGPA Calculator"),
        backgroundColor: Colors.teal.shade200,
      ),
      body: CgpaCalculator(),
    );
  }
}
