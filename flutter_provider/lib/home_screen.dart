import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'cart_provider.dart';
import 'screen_a.dart';
import 'screen_b.dart';
import 'screen_c.dart';
import 'screen_d.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("E-Commerce App"),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.shopping_cart),
              title: const Text('Screen A'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ScreenA()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.shopping_bag),
              title: const Text('Screen B'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ScreenB()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.shop),
              title: const Text('Screen C'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ScreenC()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.account_balance_wallet),
              title: const Text('Screen D'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ScreenD()),
                );
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Consumer<CartProvider>(
          builder: (context, cartProvider, child) {
            return Text(
              "Total Items: ${cartProvider.itemCount}",
              style: const TextStyle(fontSize: 24),
            );
          },
        ),
      ),
    );
  }
}
