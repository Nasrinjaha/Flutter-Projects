import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Screen1 extends StatelessWidget {
  const Screen1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
         // mainAxisAlignment: MainAxisAlignment.center,  // Center the column vertically
         // crossAxisAlignment: CrossAxisAlignment.center,  // Center the column horizontally
          children: [
            Text(
              'HI! This is screen 1',
              style: TextStyle(color: const Color.fromARGB(255, 18, 201, 214), fontSize: 50.0),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                // Navigate to Screen2 using GoRouter
                context.go('/second?titletext=Nasrin%20Jahan%20Ripa&email=ripa@gmail.com&phone=01814181019');
              },
              child: const Text('View me'),
            ),
          ],
        ),
      ),
    );
  }
}
