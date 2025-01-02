import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_connection/pages/formData.dart';

class TestForm extends StatefulWidget {
  const TestForm({super.key});

  @override
  State<TestForm> createState() => _TestFormState();
}

class _TestFormState extends State<TestForm> {
  final TextEditingController titleText = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void _saveData() {
    if (_formKey.currentState!.validate()) {
      final FirebaseFirestore _connection = FirebaseFirestore.instance;
      String mainText = titleText.text;
      _connection.collection('users').add({
        "name": mainText,
        'softDelete': false,
      });

      final snackbar = SnackBar(
        content: Text("Your data has been inserted successfully!"),
        duration: Duration(seconds: 3),
        action: SnackBarAction(label: "Undo", onPressed: () {}),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackbar);

      // Clear the text field after successful insertion
      titleText.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: titleText,
                decoration: InputDecoration(
                  labelText: "Name",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your name';
                  } else if (value.length < 3) {
                    return 'Name must be at least 3 characters long';
                  }
                  return null;
                },
              ),
            ),
            Container(
              width: double.infinity,
              height: 50.0,
              child: ElevatedButton(
                onPressed: _saveData,
                child: Text(
                  "Save",
                  style: TextStyle(color: const Color.fromARGB(255, 245, 248, 244)),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 37, 205, 70),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 15.0),
              width: double.infinity,
              height: 50.0,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => formDataCollection()),
                  );
                },
                child: Text(
                  "View Data",
                  style: TextStyle(color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 54, 30, 233),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
