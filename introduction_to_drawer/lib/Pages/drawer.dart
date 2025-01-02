import 'package:flutter/material.dart';

class new1 extends StatelessWidget {
  const new1({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: DefaultTabController(
        length: 3,
        child: Drawer1(),
      ),
    );
  }
}

class Drawer1 extends StatelessWidget {
  const Drawer1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('AppBar with Drawer'),
          leading: Builder(
            builder: (context) {
              return IconButton(
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                icon: const Icon(Icons.block),
              );
            },
          ),
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.directions_car)),
              Tab(icon: Icon(Icons.directions_transit)),
              Tab(icon: Icon(Icons.directions_bike)),
            ],
          ),
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(child: Text('main menu')),
              ListTile(
                leading: Icon(Icons.home),
                title: Text('Home'),
                onTap: () => Navigator.pop(context),
              ),
              ListTile(
                leading: Icon(Icons.settings),
                title: Text('setting'),
                onTap: () => Navigator.pop(context),
              ),
              ListTile(
                leading: Icon(Icons.login),
                title: Text('Log In'),
                onTap: () => Navigator.pop(context),
              ),
              ListTile(
                leading: Icon(Icons.logout),
                title: Text('Log Out'),
                onTap: () => Navigator.pop(context),
              ),
            ],
          ),
        ),
        body: TabBarView(children: [
          Text('tab01'),
          Text('tab02'),
          Text('tab03'),
        ]),
    );
  }
}
