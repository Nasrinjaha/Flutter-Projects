import 'package:flutter/material.dart';
import 'package:flutter_provider/pages/countercontroller.dart';
import 'package:provider/provider.dart';

class CounterScreen extends StatelessWidget {
   const CounterScreen({super.key});
  @override
  Widget build(BuildContext context) {
var controller =Provider.of<Countercontroller>(context);
    return Scaffold(
      body: Center(
        child: Consumer(builder:(context,count,child){
            return Text("${controller.count}");
        }),
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        controller.increment();
        
      }
      ,child: const Icon(Icons.add),
      ),
      
    );
  }
}