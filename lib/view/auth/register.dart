import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:techzy/view/auth/login.dart';
import 'package:techzy/view/auth/widgets/login_button.dart';
import 'package:techzy/view/screens/chatScreen.dart';


import '../../const/colors.dart';
import '../../controller/login_controller.dart';
import 'widgets/textformfieldwidget.dart';

class Register extends StatelessWidget {
  Register({super.key});
  final loginController = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.5,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                        'https://cdni.iconscout.com/illustration/premium/thumb/login-page-4468581-3783954.png'))),
          ),
          TextformfieldWidget(
            controller: loginController.registerEmailController,
            hintText: 'Email',
            icon: Icons.email,
          ),
          TextformfieldWidget(
            controller: loginController.registerPasswordController,
            hintText: 'Password',
            icon: Icons.lock,
          ),
          const SizedBox(
            height: 30,
          ),
          LoginButton(
            text: 'Register',
            onPressed: ()async {
             
              try {
             await   FirebaseAuth.instance
                  .createUserWithEmailAndPassword(
                      email: loginController.registerEmailController.text,
                      password: loginController.registerPasswordController.text)
                  .then((value) {
                Get.offAll(() =>  ChatScreen());
                FirebaseFirestore.instance
                    .collection('user')
                    .doc(FirebaseAuth.instance.currentUser!.uid)
                    .set({
                  "email": loginController.registerEmailController.text,
                  "password": loginController.registerPasswordController.text
                });
              });
                
              }on FirebaseAuthException catch (e) {
                if(e.code == 'weak-password'){
                  Get.snackbar('Weak Password', 'Your password is  week please re-enter it');
                }else if(e.code == 'email-already-in-use'){
                  Get.snackbar('Email Already Exist', 'The account already exist for that email');
                }
                
              }catch(e){
                Get.snackbar('Warning', e.toString());
              }
              
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: RichText(
              text: TextSpan(
                text: 'Already have an Account?',
                style: const TextStyle(color: Appcolors.primaryColor),
                children: [
                  TextSpan(
                      text: 'Signin',
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Get.to(() => LoginPage());
                        }),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
