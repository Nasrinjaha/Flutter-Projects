import 'package:flutter/material.dart';

class ContactCard extends StatelessWidget {
  final String name;
  final String designation;
  final String email;
  final String phone;

  ContactCard({
    required this.name,
    required this.designation,
    required this.email,
    required this.phone,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(12),
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CircleAvatar(
              radius: 40,
              backgroundColor: Colors.lightGreen,
              child: Icon(Icons.person, size: 20, color: Colors.white38),
            ),
            const SizedBox(width: 8),
            // Use Column to allow the text to wrap
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    designation,
                    maxLines: 2, // Allow up to 2 lines
                    overflow: TextOverflow.ellipsis, // If text overflows, show "..."
                    style: const TextStyle(color: Colors.grey),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(
                        Icons.email_outlined,
                        size: 15,
                      ),
                      const SizedBox(width: 5),
                      Text(
                        email,
                        maxLines: 2, // Allow up to 2 lines
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(color: Colors.blue),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(
                        Icons.phone,
                        size: 15,
                      ),
                      const SizedBox(width: 5),
                      Text(
                        phone,
                        style: const TextStyle(color: Colors.blue),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.blue,
        scaffoldBackgroundColor: Colors.white70,
        textTheme: TextTheme(
            bodySmall: TextStyle(
              fontSize: 10,
              color: Colors.red,
              fontWeight: FontWeight.bold,
            ),
          bodyMedium: TextStyle(
            fontSize: 15,
            color: Colors.green,
            fontWeight: FontWeight.bold,
          ),
          bodyLarge: TextStyle(
            fontSize: 30,
            color: Colors.tealAccent,
            fontWeight: FontWeight.bold,
          ),
        ),
       /* ButtonTheme:ButtonTheme(
            //child: child,
        ),*/
      ),

      home: Scaffold(
        backgroundColor: Colors.grey,
        appBar: AppBar(title: const Text('This is AppBar')),
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: SingleChildScrollView(
            child: Column(
              children: [
                ContactCard(
                  name: 'Nasrin Jahan Ripa',
                  designation: 'Software Engineer and Flutter Developer at XYZ Corp.',
                  email: 'ripa.cse.puc.bd@gmail.com',
                  phone: '01835493825',
                ),
                ContactCard(
                  name: 'A',
                  designation: 'Learner and aspiring Developer.',
                  email: 'ripa.cse.puc.bd@gmail.com',
                  phone: '01835493825',
                ),
                ContactCard(
                  name: 'B',
                  designation: 'Design Expert in UI/UX and Flutter Developer.',
                  email: 'ripa.cse.puc.bd@gmail.com',
                  phone: '01835493825',
                ),
                ContactCard(
                  name: 'C',
                  designation: 'Developer and Product Manager.',
                  email: 'ripa.cse.puc.bd@gmail.com',
                  phone: '01835493825',
                ),
                ContactCard(
                  name: 'D',
                  designation: 'Full Stack Developer and Data Scientist.',
                  email: 'ripa.cse.puc.bd@gmail.com',
                  phone: '01835493825',
                ),
                ContactCard(
                  name: 'E',
                  designation: 'Flutter Developer and App Architect.',
                  email: 'ripa.cse.puc.bd@gmail.com',
                  phone: '01835493825',
                ),
                ContactCard(
                  name: 'F',
                  designation: 'Back-End Developer and Cloud Specialist.',
                  email: 'ripa.cse.puc.bd@gmail.com',
                  phone: '01835493825',
                ),
                ContactCard(
                  name: 'G',
                  designation: 'AI Engineer and Machine Learning Expert.',
                  email: 'ripa.cse.puc.bd@gmail.com',
                  phone: '01835493825',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(const MyApp());
}
