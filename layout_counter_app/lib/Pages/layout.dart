import 'package:flutter/material.dart';

class MyLayout extends StatelessWidget {
  const MyLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // First row: 2 boxes
        Row(
          children: [
            Container(
              margin: const EdgeInsets.all(8.0),
              width: 70, 
              height: 50, 
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 2),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(8.0),
              width: 65, 
              height: 50, 
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 2),
              ),
            ),
          ],
        ),
        // Second row: 1 box
        Row(
          children: [Container(
              margin: const EdgeInsets.all(8.0),
              width: 50,
              height: 60,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 2),
              ),
            ),
          ],
        ),
        // Third row: 3 boxes
        Row(
          children: [
            Container(
              margin: const EdgeInsets.all(8.0),
              width: 50, 
              height: 60, 
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 2),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(8.0),
              width: 48, 
              height: 50,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 2),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(8.0),
              width: 60, 
              height: 50, 
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 2),
              ),
            ),
          ],
        ),
        // Fourth row: 1 box
        Row(
          children: [Container(
              margin: const EdgeInsets.all(8.0),
              width: 50,
              height: 60,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 2),
              ),
            ),
          ],
        ),
        // Fifth row: 2 boxes
        Row(
          children: [
            Container(
              margin: const EdgeInsets.all(8.0),
              width: 55, 
              height: 60, 
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 2),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(8.0),
              width: 50, 
              height: 50, 
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 2),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
