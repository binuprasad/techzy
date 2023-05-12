import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:techzy/controller/login_controller.dart';
import 'package:techzy/view/auth/register.dart';
import 'package:techzy/view/auth/widgets/login_button.dart';
import 'package:techzy/view/screens/chatScreen.dart';

import '../../const/colors.dart';
import 'widgets/textformfieldwidget.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  final loginController = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
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
              controller: loginController.emailController,
              hintText: 'Email',
              icon: Icons.email,
            ),
            TextformfieldWidget(
              controller: loginController.passwordController,
              hintText: 'Password',
              icon: Icons.lock,
            ),
            const SizedBox(
              height: 30,
            ),
            LoginButton(
              text: 'Sigin',
              onPressed: () async {
                try {
                  await FirebaseAuth.instance
                      .signInWithEmailAndPassword(
                          email: loginController.emailController.text.trim(),
                          password:
                              loginController.passwordController.text.trim())
                      .then((value) => Get.offAll(() => ChatScreen()));
                } on FirebaseAuthException catch (e) {
                  if (e.code == 'user-notfound') {
                    Get.snackbar('No user', 'User not found for this email');
                  } else if (e.code == 'wrong-password') {
                    Get.snackbar('Wrong Password',
                        'The password is in correct please check your password');
                  }
                } catch (e) {
                  Get.snackbar('Warning!', e.toString());
                }
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: RichText(
                text: TextSpan(
                  text: "Don't have an account?",
                  style: const TextStyle(color: Appcolors.primaryColor),
                  children: [
                    TextSpan(
                        text: ' Register',
                        style: const TextStyle(
                            fontWeight: FontWeight.w500, color: Colors.black),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Get.to(() => Register());
                          }),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
