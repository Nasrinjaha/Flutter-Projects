import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class SoftDeletedItemsScreen extends StatelessWidget {
  final softDeletedStream = FirebaseFirestore.instance
      .collection('users')
      .where('softDelete', isEqualTo: true)
      .snapshots();

  Future<void> _restoreData(String id) async {
    await FirebaseFirestore.instance.collection('users').doc(id).update({
      'softDelete': false,
    });
  }

  Future<void> _hardDeleteData(String id) async {
    await FirebaseFirestore.instance.collection('users').doc(id).delete();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Deleted Items',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.blueAccent,
      ),
      body: StreamBuilder(
        stream: softDeletedStream,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
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
                        _restoreData(doc.id);
                      },
                      icon: Icon(Icons.restore, color: Colors.green),
                    ),
                    IconButton(
                      onPressed: () {
                        _hardDeleteData(doc.id);
                      },
                      icon: Icon(Icons.delete, color: Colors.red),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
