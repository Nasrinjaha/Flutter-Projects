import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class TestForm extends StatefulWidget {
   const TestForm({super.key});
   
  @override
  State<TestForm> createState() => _TestFormState();
}

class _TestFormState extends State<TestForm> {
  final TextEditingController titleText = TextEditingController();
  void _saveData(){
    final FirebaseFirestore _connection = FirebaseFirestore.instance;
    String mainText = titleText.text;
    _connection.collection('users').add({
      "name":mainText,
    });
    final snackbar = SnackBar(content: Text("Your data have been inserted successfully!"),duration: Duration(seconds: 3),
    action: SnackBarAction(label: "undo", onPressed: (){}),);
    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: titleText,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0)
                )
              ),
            ),
          ),
          ElevatedButton(onPressed: _saveData, child: Text("Click"))
        ],
      ),
    );
  }
}