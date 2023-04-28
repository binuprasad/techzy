import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:techzy/view/auth/login.dart';

void main()async {
  runApp(const MyApp());

  WidgetsFlutterBinding.ensureInitialized();            
 await Firebase.initializeApp();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
debugShowCheckedModeBanner: false,
      theme: ThemeData(
        
        primarySwatch: Colors.blue,
      ),
      home:  LoginPage(),
    );
  }
}

