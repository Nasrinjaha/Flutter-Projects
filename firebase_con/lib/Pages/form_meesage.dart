import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class FormMessageShow extends StatefulWidget {
  const FormMessageShow({super.key});

  @override
  State<FormMessageShow> createState() => _FormMessageShowState();
}

class _FormMessageShowState extends State<FormMessageShow> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChangeNotifierProvider<HomeProvider>(
        create:(context){
          return HomeProvider();
        },
        child: Consumer<HomeProvider>(builder: (context,Provider,child){
          return Column(
            children: [
              Text(Provider.eligibleMessage.toString(),style: TextStyle(
                color: (Provider.eligibility==true)?Colors.red:Colors.green
              ),),
              TextFormField(
                onChanged: (value) => Provider.checkEligible(int.parse(value)),
              ),
              
            ],
          );
        }),
        ),
    );
  }
}