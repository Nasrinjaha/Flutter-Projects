import 'package:flutter/material.dart';

void main(){
  runApp(Myapp());
}
class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ToggleBUtton(),
    );
  }
}

class ToggleBUtton extends StatefulWidget {
  const ToggleBUtton({super.key});

  @override
  State<ToggleBUtton> createState() => _ToggleBUttonState();
}

class _ToggleBUttonState extends State<ToggleBUtton> {
  bool _isBlue = false;
  void BackgroundChange(){
     setState(() {
       _isBlue = !_isBlue;
     });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('this is Appbar'),
      ),
      backgroundColor: _isBlue? Colors.blue:Colors.white70,
      body: Center(
        child: ElevatedButton(
            onPressed: BackgroundChange,
            child: Text('Color change button'),
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
               // side: BorderSide(color: Colors.redAccent,width: 20),
              ),
              padding: EdgeInsets.symmetric(horizontal: 30,vertical: 30),
              elevation: 100,
              shadowColor: Colors.black.withOpacity(0.4),
              minimumSize: Size(120, 50),
              side: BorderSide(color: Colors.blue,width: 2),
              visualDensity: VisualDensity.adaptivePlatformDensity,
              enableFeedback: true,
            ),
            
        ),
      ),
    );
  }
}


