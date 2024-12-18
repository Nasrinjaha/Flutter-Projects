import 'package:flutter/material.dart';
import 'Pages/counter.dart';
import 'Pages/layout.dart'; // Import the custom widget

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Custom Counter and Layout App',
        style: TextStyle(
                fontSize: 20, // Custom font size
                fontWeight: FontWeight.bold, // Bold text
                color: Color.fromARGB(150, 9, 9, 9), 
              ),
            ),
            backgroundColor: Colors.tealAccent,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
           CounterWidget(),
           SizedBox(height: 30), 
           MyLayout(),
        ],
      ),
    );
  }
}
