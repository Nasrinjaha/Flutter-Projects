import 'package:flutter/material.dart';
// ignore: unused_import
import 'Screen2.dart';

class Screen1 extends StatelessWidget {
  const Screen1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text(
            'HI!This is screen 1',
            style: TextStyle(color: Colors.amberAccent, fontSize: 50.0),
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => Screen2()),
                );
              },
              child: Text('View me')),
        ],
      ),
    );
  }
}
