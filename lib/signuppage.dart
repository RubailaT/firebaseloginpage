  import 'package:firebaseloginpage/getpage.dart';
import 'package:firebaseloginpage/loginpage.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController susername=TextEditingController();
  TextEditingController spassword=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            
            Text("Enter your Details",style: TextStyle(color: Colors.blue,fontSize: 30),),
      Padding(
      padding: const EdgeInsets.all(15.0),
      child: TextFormField(
        controller: susername,
        decoration: InputDecoration(

          border: OutlineInputBorder(),
          labelText: 'email-id',
          hintText: 'Enter email-id',
        ),

      ),
    ),

    SizedBox(height: 50,),

    Padding(
    padding: const EdgeInsets.all(15.0),
    child: TextFormField(
    controller: spassword,
    obscureText: true,
    decoration: InputDecoration(
    border: OutlineInputBorder(),
    labelText: 'Password' ,
    hintText: 'Enter Password',
    ),
    ),
    ),

    ElevatedButton(onPressed: (){

   AuthController.instance.register(susername.text.trim(), spassword.text.trim());

    },
    child: Text("Sign up")),
    ],
      ),

    );
  }
}
