import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:techzy/controller/login_controller.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final logincontroller = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              logincontroller.signOut();
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: const Center(
        child: Text('data'),
      ),
    );
  }
}
