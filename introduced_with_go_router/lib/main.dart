import 'package:flutter/material.dart';
import 'package:introduced_with_go_router/pages/Screen1.dart';
import 'package:introduced_with_go_router/pages/Screen2.dart';
//import 'package:datapassing/pages/screen3.dart';
// ignore: depend_on_referenced_packages
import 'package:go_router/go_router.dart';
void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final GoRouter _router = GoRouter(
  routes:[
    GoRoute(
      path: '/',
      builder: (context, state) => Screen1()),
      GoRoute(path:'/second',builder: (context,state)=> Screen2(titletext: 'Nasrin Jahan Ripa',email:'ripa@gmail.com',phone:'01814181019'),)
  ],
);


  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
    );
  }
}
