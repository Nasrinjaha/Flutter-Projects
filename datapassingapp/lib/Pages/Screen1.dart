import 'package:flutter/material.dart';

class Screen1 extends StatelessWidget {
  const Screen1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'HI! This is screen 1',
              style: TextStyle(color: Colors.amberAccent, fontSize: 50.0),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                // Navigate to Screen2
                Navigator.pushNamed(context, '/second');
              },
              child: const Text('View me'),
            ),
          ],
        ),
      ),
    );
  }
}
