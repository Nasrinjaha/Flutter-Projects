import 'package:flutter/material.dart';

class Screen3 extends StatelessWidget {
  
final String argument; 
  const Screen3({super.key, required this.argument});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text(  
          argument,
            style: TextStyle(color: Colors.amberAccent, fontSize: 50.0),
          ),
          ElevatedButton(
              onPressed: () {
                // Navigate back to Screen1
                Navigator.pushNamed(context, '/');
              },
              child: const Text('Go Back to screen1'),
            ),
            SizedBox(height: 30,),
            ElevatedButton(
              onPressed: () {
                // Navigate back to Screen1
                Navigator.pushNamed(context, '/second');
              },
              child: const Text('Go Back to screen2'),
            ),
        ],
      ),
    );
  }
}
