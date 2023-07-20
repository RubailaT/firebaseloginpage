

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebaseloginpage/loginpage.dart';
import 'package:firebaseloginpage/resultpage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController{ // should be responsible for navigate different pages

  static AuthController instance=Get.find(); //would able to access all the properties from my page
  late Rx<User?> _user;//it includes our user info
FirebaseAuth auth=FirebaseAuth.instance;



@override  //initialization the things come from network
void onReady() {
  super.onReady();
  _user = Rx<User?>(auth.currentUser); // cast to getx so we use Rx<User?>
  //when user is alive the user itself notified because of bindstreamfunction
  _user.bindStream(auth.userChanges()); //to track user things we use bindstream
  //it will be listening all the time changes
  ever(_user,
      _initialScreen); //ever function takes a listener and call back function
}
_initialScreen(User? user){
  if(user==null) {
    print("login page");
    Get.offAll(() => LoginPage());
  }
  else{
    Get.offAll(()=>Result());
  }
}
void register(String email,password)async{
  try {
    await auth.createUserWithEmailAndPassword(email: email, password: password);
_user.value!=null? Get.offAll(()=>const LoginPage()):Get.to(()=>const LoginPage());
  }
  catch(e){
    Get.snackbar("About user","User message",
    backgroundColor: Colors.redAccent,
    snackPosition: SnackPosition.BOTTOM,
    titleText: Text(
        "Account Creation failed"),
  messageText: Text(e.toString()));
  }
}
void login(String email,password)async{
  try {
    await auth.signInWithEmailAndPassword(email: email, password: password);
  }
  catch(e){
    Get.snackbar("About Login", "Login message",
      backgroundColor: Colors.redAccent,
      snackPosition: SnackPosition.BOTTOM,
      titleText: Text("Login failed"),
      messageText: Text(e.toString())
    );


  }
}
void logOut()async{
  await auth.signOut();

}

}

