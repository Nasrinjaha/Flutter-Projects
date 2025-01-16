import 'package:flutter/material.dart';
import 'package:flutter_provider/Pages/from_data.dart';
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
                color: (Provider.eligibility==true)?const Color.fromARGB(255, 19, 207, 63):const Color.fromARGB(255, 236, 28, 28)
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