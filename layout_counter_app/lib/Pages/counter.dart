import 'package:flutter/material.dart';

class CounterWidget extends StatefulWidget {
  const CounterWidget({super.key});

  @override
  State<CounterWidget> createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "$counter",
          style: TextStyle(fontSize: 32),
        ),
        ElevatedButton(
          onPressed: () {
            setState(() {
              counter++;
            });
            print("Counter Value: $counter"); 
          },
          child: Text('Counter'),
        ),
      ],
    );
  }
}
