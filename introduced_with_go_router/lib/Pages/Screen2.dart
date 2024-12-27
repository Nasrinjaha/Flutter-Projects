import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Screen2 extends StatelessWidget {
  final String titletext;
  final String email;
  final String phone;
  const Screen2({
    super.key,
    required this.titletext,
    required this.email,
    required this.phone,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          //crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Name: $titletext',  // Display passed text
              style: TextStyle(color: const Color.fromARGB(255, 7, 23, 255), fontSize: 20.0),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 8),
            Text(
              'Email: $email',  // Display passed text
              style: TextStyle(color: const Color.fromARGB(255, 7, 32, 255), fontSize: 20.0),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 8),
            Text(
              'Phone: $phone',  // Display passed text
              style: TextStyle(color: const Color.fromARGB(255, 11, 7, 255), fontSize: 20.0),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {
                // Navigate back to Screen1 using GoRouter
                context.go('/');
              },
              child: const Text('Go Back'),
            ),
            SizedBox(height: 8),
            // ElevatedButton(
            //   onPressed: () {
            //     // Navigate to Screen3 using GoRouter
            //     context.go('/third');
            //   },
            //   child: const Text('View Screen3'),
            // ),
          ],
        ),
      ),
    );
  }
}
