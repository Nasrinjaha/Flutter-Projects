import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_connection/pages/formData.dart';
import 'package:flutter/services.dart';

class TestForm extends StatefulWidget {
  const TestForm({super.key});

  @override
  State<TestForm> createState() => _TestFormState();
}

class _TestFormState extends State<TestForm> {
  final TextEditingController titleText = TextEditingController();
  final TextEditingController emailText = TextEditingController();
  final TextEditingController phoneText = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  // Check for duplicate email
  Future<bool> _isDuplicateEmail(String email) async {
    final querySnapshot = await FirebaseFirestore.instance.collection('users').where('email', isEqualTo: email).get();
    return querySnapshot.docs.isNotEmpty; // Returns true if a document with the same email exists
  }

  void _saveData() async {
    if (_formKey.currentState!.validate()) {
      String name = titleText.text;
      String email = emailText.text;
      String phone = phoneText.text;

      // Check if the email is already in the database
      bool isDuplicate = await _isDuplicateEmail(email);
      if (isDuplicate) {
        // Show a Snackbar if the email is already in use
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('This email is already in use!')),
        );
        return; // Stop further execution
      }

      // If no duplicates, save data to Firestore
      final FirebaseFirestore _connection = FirebaseFirestore.instance;

      _connection.collection('users').add({
        "name": name,
        "email": email,
        "phone": phone,
        'softDelete': false,
      });

      // Show a Snackbar indicating success
      final snackbar = SnackBar(
        content: Text("Your data has been inserted successfully!"),
        duration: Duration(seconds: 3),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackbar);

      // Clear the text fields after successful insertion
      titleText.clear();
      emailText.clear();
      phoneText.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Test Form"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction, // Enable auto-validation
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
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
              const SizedBox(height: 10.0),
              TextFormField(
                controller: emailText,
                decoration: InputDecoration(
                  labelText: "Email",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                    return 'Please enter a valid email address';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10.0),
              TextFormField(
                controller: phoneText,
                decoration: InputDecoration(
                  labelText: "Phone",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                keyboardType: TextInputType.phone,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                ],
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your phone number';
                  } else if (!RegExp(r'^\d{10,11}$').hasMatch(value)) {
                    return 'Please enter a valid phone number (10-15 digits)';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: _saveData,
                child: Text(
                  "Save",
                  style: TextStyle(color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                ),
              ),
              const SizedBox(height: 10.0),
              ElevatedButton(
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
                  backgroundColor: Colors.blue,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
