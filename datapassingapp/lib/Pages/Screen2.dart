import 'package:flutter/material.dart';


class Screen2 extends StatelessWidget {
  final String titletext;  // Type declaration for titletext

  const Screen2({super.key, required this.titletext});

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
              titletext,  // Display passed text
              style: TextStyle(color: Colors.amber, fontSize: 50.0),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                // Navigate back to Screen1
                Navigator.pop(context);
              },
              child: const Text('Go Back'),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                // Navigate back to Screen1
                Navigator.pushNamed(context, '/third');
              },
              child: const Text('Go to third'),
            ),
          ],
        ),
      ),
    );
  }
}
