import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'cart_provider.dart';

class ScreenC extends StatelessWidget {
  const ScreenC({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Screen C"),
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
