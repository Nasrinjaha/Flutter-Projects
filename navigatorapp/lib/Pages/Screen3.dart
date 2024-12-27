import 'package:flutter/material.dart';
import 'Screen2.dart';

class Screen3 extends StatelessWidget {
  const Screen3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text(
            'HI!This is screen 3',
            style: TextStyle(color: Colors.amberAccent, fontSize: 50.0),
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop(
                  MaterialPageRoute(builder: (context) => Screen2()),
                );
              },
              child: Text('Back')),
        ],
      ),
    );
  }
}
