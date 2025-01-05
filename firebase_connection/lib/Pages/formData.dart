import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_connection/pages/softdelete.dart';

class formDataCollection extends StatefulWidget {
  const formDataCollection({super.key});

  @override
  State<formDataCollection> createState() => _formDataCollectionState();
}

class _formDataCollectionState extends State<formDataCollection> {
  final stremContent = FirebaseFirestore.instance
      .collection('users')
      .where('softDelete', isEqualTo: false)
      .snapshots();

  // Update
  Future<void> _updateData(id, name, email, phone) async {
    await FirebaseFirestore.instance.collection('users').doc(id).update({
      "name": name,
      "email": email,
      "phone": phone,
      'softDelete': false,
    });
  }

  // Prevent Duplicate Email Data
  Future<bool> _isDuplicateEmail(String email) async {
    final query = await FirebaseFirestore.instance.collection('users').get();

    for (var doc in query.docs) {
      final data = doc.data() as Map;
      if (data['email'] == email) {
        return true; // Duplicate email found
      }
    }
    return false; // No duplicate found
  }

  // Soft Delete with Snackbar and Undo
  Future<void> _softDeleteData(String id, String name) async {
    await FirebaseFirestore.instance.collection('users').doc(id).update({
      'softDelete': true,
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('$name deleted'),
        duration: Duration(seconds: 3),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () async {
            await FirebaseFirestore.instance.collection('users').doc(id).update({
              'softDelete': false,
            });
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'All Items',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.blueAccent,
      ),
      body: StreamBuilder(
        stream: stremContent,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          final docs = snapshot.data!.docs;
          return ListView.builder(
            itemCount: docs.length,
            itemBuilder: (context, index) {
              final doc = docs[index];
              final content = doc.data() as Map;
              return ListTile(
                title: Text(content['name']),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      onPressed: () {
                        _showDialog(context, index, content['name'], content['email'], content['phone'], doc.id);
                      },
                      icon: Icon(Icons.edit),
                    ),
                    IconButton(
                      onPressed: () {
                        _softDeleteData(doc.id, content['name']);
                      },
                      icon: Icon(Icons.delete),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SoftDeletedItemsScreen()),
          );
        },
        child: Icon(Icons.delete),
      ),
    );
  }

  // Show Dialog Box for edit data
  void _showDialog(context, index, contentName, contentEmail, contentPhone, id) {
    TextEditingController nameController = TextEditingController(text: contentName);
    TextEditingController emailController = TextEditingController(text: contentEmail);
    TextEditingController phoneController = TextEditingController(text: contentPhone);
    final _formKey = GlobalKey<FormState>();

    showDialog(
      context: (context),
      builder: (context) {
        return AlertDialog(
          title: Text('Edit Data'),
          content: Form(
            key: _formKey,
            child: Container(
              width: double.minPositive,
              height: 250,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormField(
                    controller: nameController,
                    decoration: InputDecoration(
                      labelText: 'Name',
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
                  const SizedBox(height: 8.0),
                  TextFormField(
                    controller: emailController,
                    decoration: InputDecoration(
                      labelText: 'Email',
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
                  const SizedBox(height: 8.0),
                  TextFormField(
                    controller: phoneController,
                    decoration: InputDecoration(
                      labelText: 'Phone',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    keyboardType: TextInputType.phone,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your phone number';
                      } else if (!RegExp(r'^\d{10,15}$').hasMatch(value)) {
                        return 'Please enter a valid phone number (10-15 digits)';
                      }
                      return null;
                    },
                  ),
                ],
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Cancel"),
            ),
            ElevatedButton(
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  // Check for duplicate email before updating
                  bool isDuplicate = await _isDuplicateEmail(emailController.text);
                  if (isDuplicate) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('This email is already in use!'),
                      ),
                    );
                  } else {
                    // If no duplicates, update the data
                    _updateData(id, nameController.text, emailController.text, phoneController.text);
                    Navigator.pop(context);
                  }
                }
              },
              child: Text("Save"),
            ),
          ],
        );
      },
    );
  }
}
