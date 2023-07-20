 import 'package:firebaseloginpage/getpage.dart';
import 'package:firebaseloginpage/resultpage.dart';
import 'package:firebaseloginpage/signuppage.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController username=TextEditingController();
  TextEditingController password=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextFormField(
              controller: username,
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
              controller: password,

              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Password' ,
                hintText: 'Enter Password',
              ),

            ),
          ),

          ElevatedButton(onPressed: (){

            AuthController.instance.login(username.text.trim(), password.text.trim());
          },
              child: Text("Login")),

          // Text("Dont't have a account?  sign up")
    RichText(
    text: TextSpan(
    text: "Don't Have an account?",
    style: TextStyle(fontSize: 20,
        color: Colors.grey,),

    children: [

    TextSpan(
      text: '   Sign up',style: TextStyle(fontSize: 20,
        color: Colors.blue,fontWeight: FontWeight.bold),
      recognizer: TapGestureRecognizer()..onTap = () {
        Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUp()));// Single tapped.
      },
    ),


    ],
    ),
    ),

        ],
      ),
    );
  }
}
