import 'package:flutter/material.dart';

class Countercontroller with ChangeNotifier{
  int _count = 0;
  int get count =>_count;

  void increment(){
    _count++;
    notifyListeners();
  }
  void dicrement(){
    
  }
}