import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'This is my AppBar',
            style: TextStyle(
              fontSize: 30,
              color: Colors.black, // Change the text color of the AppBar title
            ),
          ),
          backgroundColor: Colors.blueAccent,
          actions: [
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {
                print('Search Pressed');
              },
            )
          ],
        ),
        drawer: Drawer(
          child: ListView(
            children: [
              const DrawerHeader(child: Text("header")),
              ListTile(
                title: const Text('Item 1'),
                onTap: () {
                  print('Item 1 selected');
                },
              )
            ],
          ),
        ),
        body: Center(
          child: Builder(
            builder: (BuildContext context) {
              return ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                        'SnackBar Pressed',
                        style: TextStyle(fontSize: 30),
                      ),
                      duration: Duration(seconds: 3),
                    ),
                  );
                },
                child: const Text('This is the child of ElevatedButton'),
              );
            },
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed, // Set type to fixed
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.category),
              label: 'Category',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add_shopping_cart),
              label: 'Cart',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_box_outlined),
              label: 'Account',
            ),
          ],
          currentIndex: 0,
          onTap: (index) {
            print('Tab $index tapped');
          },
          backgroundColor: Colors.tealAccent, // Set the background color
          selectedItemColor: Colors.red, // Color for the selected icon
          unselectedItemColor: Colors.black, // Color for unselected icons
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            print('Floating Action Button Pressed');
          },
          backgroundColor: Colors.orange,
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
