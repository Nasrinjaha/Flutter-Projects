import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
//import 'Screen2.dart';

class FormValidation extends StatefulWidget {
  @override
  _FormValidationState createState() => _FormValidationState();
}

class _FormValidationState extends State<FormValidation> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // Controllers to capture text input
  TextEditingController _userNameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();

  // String to hold submitted data
  String _submittedData = "";

  // Form submit function
  void _formSubmit() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _submittedData =
            "Name: ${_userNameController.text}\nEmail: ${_emailController.text}\nPhone: ${_phoneController.text}";

        _userNameController.clear();
        _emailController.clear();
        _phoneController.clear(); 
        //_isSubmitted = true; 
        //Navigator.of(context).push(
          // MaterialPageRoute(builder: (context) => Screen2(titletext: _submittedData)),
        //);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Contact Form',
                style: TextStyle(
                  color: Colors.greenAccent,
                  fontWeight: FontWeight.bold,
                  fontSize: 30.0,
                ),
              ),
              const SizedBox(height: 8.0),

              // User Name Field
              TextFormField(
                controller: _userNameController,
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  floatingLabelStyle: TextStyle(
                      color: const Color.fromARGB(255, 48, 36, 158)),
                  labelText: "User Name",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your username';
                  } else if (value.length < 3) {
                    return 'Username must be at least 3 characters long';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 8.0),

              // Email Field
              TextFormField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  floatingLabelStyle: TextStyle(
                      color: const Color.fromARGB(255, 6, 30, 136)),
                  labelText: "Email",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  } else if (!value.contains('@') || !value.contains('.')) {
                    return 'Please enter a valid email address';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 8.0),

              // Phone Field
              TextFormField(
                controller: _phoneController,
                keyboardType: TextInputType.phone,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                ],
                decoration: InputDecoration(
                  floatingLabelStyle: TextStyle(
                      color: const Color.fromARGB(255, 120, 54, 244)),
                  labelText: "Phone",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your phone number';
                  } else if (value.length < 10) {
                    return 'Phone number must be at least 10 digits long';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),

              // Submit Button
              SizedBox(
                width: double.infinity,
                height: 50.0,
                child: ElevatedButton(
                  onPressed: _formSubmit,
                  child: const Text(
                    'Submit',
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                ),
              ),

              const SizedBox(height: 16.0),

              // Display submitted data
              if (_submittedData.isNotEmpty)
                Text(
                  _submittedData,
                  style: TextStyle(fontSize: 16.0, color: Colors.black87),
                ),
            
            ],
          ),
        ),
      ),
    );
  }
}