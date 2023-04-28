import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController{
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController registerEmailController=TextEditingController();
  final TextEditingController registerPasswordController = TextEditingController();


  signOut()async{
   await FirebaseAuth.instance.signOut();
  }
}