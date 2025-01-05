import 'package:flutter/material.dart';

class HomeProvider with ChangeNotifier{
  bool ?eligibility;
  String? eligibleMessage="";
  checkEligible(int age){
    if(age>18){
      eligibility =true;
      eligibleMessage ="You are Elegible";
      notifyListeners();
    }else{
      eligibility = false;
      eligibleMessage ="You are not Eligible";
      notifyListeners();
    }
  }
}