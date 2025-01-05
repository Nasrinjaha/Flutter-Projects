import 'package:flutter/material.dart';
import 'package:firebase_con/pages/form_meesage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp( MyApp());
}
class MyApp extends StatelessWidget {
   const MyApp({super.key});
  // final GoRouter _router = GoRouter(routes: 
  // [GoRoute(path: '/',
  // builder: (context, state) => const Screen1()),
  // GoRoute(path: '/second',builder: (context, state) => const Screen02(name: "name", email: "email", phone: "phone"),)
  
  // ]
  // );

  @override
  Widget build(BuildContext context) {
    return   const MaterialApp(
     // home:DefaultTabController(length: 3, child: CustomDrawer()),
     // home:Fomvalidation(),
     home:FormMessageShow(),
    );
  }
}
