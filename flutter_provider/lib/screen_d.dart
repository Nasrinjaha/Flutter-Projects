import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'cart_provider.dart';

class ScreenD extends StatelessWidget {
  const ScreenD({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Screen D"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer<CartProvider>(
              builder: (context, cartProvider, child) {
                return Text(
                  "Total Items: ${cartProvider.itemCount}",
                  style: const TextStyle(fontSize: 24),
                );
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Provider.of<CartProvider>(context, listen: false).resetCart();
              },
              child: const Text("Reset Cart"),
            ),
          ],
        ),
      ),
    );
  }
}
