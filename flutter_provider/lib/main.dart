import 'package:flutter/material.dart';
//import 'package:flutter_provider/pages/countercontroller.dart';
import 'package:flutter_provider/cart_provider.dart';
//import 'package:flutter_provider/pages/counter_screen.dart';
import 'package:flutter_provider/home_screen.dart';
import 'package:provider/provider.dart';

void main(){
  runApp( 
    ChangeNotifierProvider<CartProvider>(
      create: (_)=>CartProvider(),
      child: const MyApp(),
      )
  );
}
class MyApp extends StatelessWidget {
   const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return  const MaterialApp(
    debugShowCheckedModeBanner: false,
     home: const HomeScreen(),
    );
  }
}