import 'package:flutter/material.dart';
import 'Screen1.dart';
import 'Screen3.dart';

class Screen2 extends StatelessWidget {
  const Screen2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text(
            'Thanks for Watching me!',
            style: TextStyle(color: Colors.amber, fontSize: 50.0),
          ),
          ElevatedButton(
            onPressed: () {
              // Navigate to Screen1
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => Screen1(),
                ),
              );
            },
            child: Text('Go Back'),
          ),
          ElevatedButton(
            onPressed: () {
              // Navigate to Screen3
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => Screen3(),
                ),
              );
            },
            child: Text('Go to third screen'),
          ),
        ],
      ),
    );
  }
}
