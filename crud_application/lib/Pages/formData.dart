import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:crud_application/pages/softdelete.dart';

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
  Future<void> _updateData(id, showData) async {
    await FirebaseFirestore.instance.collection('users').doc(id).update({
      "name": showData,
      'softDelete': false,
    });
  }

  // Soft Delete with Snackbar and Undo
  Future<void> _softDeleteData(String id, String name) async {
    // Temporarily mark the item for deletion
    await FirebaseFirestore.instance.collection('users').doc(id).update({
      'softDelete': true,
    });

    // Show Snackbar with Undo option
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('$name deleted'),
        duration: Duration(seconds: 3), // Keep the Snackbar visible for 5 seconds
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () async {
            // Revert the soft delete
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
                        _showDialog(context, index, content['name'], doc.id);
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
  void _showDialog(context, index, content, id) {
    TextEditingController showData = TextEditingController(text: content);

    showDialog(
      context: (context),
      builder: (context) {
        return AlertDialog(
          title: Text('Edit Data'),
          content: TextField(
            controller: showData,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
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
              onPressed: () {
                _updateData(id, showData.text);
                Navigator.pop(context);
              },
              child: Text("Save"),
            ),
          ],
        );
      },
    );
  }
}