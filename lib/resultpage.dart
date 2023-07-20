 import 'package:firebaseloginpage/getpage.dart';
import 'package:flutter/material.dart';

class Result extends StatefulWidget {
  const Result({Key? key}) : super(key: key);

  @override
  State<Result> createState() => _ResultState();
}

class _ResultState extends State<Result> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Text("welcome"),
        actions: [
          IconButton(

            icon: const Icon(Icons.login_outlined),
            onPressed: () {
AuthController.instance.logOut();
            },
          ),
        ],

      ),
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child:
          Container(


              child: Text("Welcome Home",style: TextStyle(color: Colors.white,fontSize: 40,fontWeight: FontWeight.bold),))),
        ],
      ),
    );
  }
}
