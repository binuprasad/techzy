import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:techzy/const/colors.dart';
import 'package:techzy/view/screens/widgets/messege_tile.dart';

import '../../controller/chatcontroller.dart';

class ChatScreen extends StatelessWidget {
  ChatScreen({super.key});
  final chatcontroller = Get.put(ChatController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () {
          
        }, icon: const Icon(Icons.chevron_left_sharp)),
        backgroundColor: Appcolors.primaryColor,
        title: const Text('Person'),
      ),
      body: Stack(
        children: <Widget>[
          ListView.builder(
            itemCount: 1,
            itemBuilder: (BuildContext context, int index) {
              return const MessageTile(
                message: 'hi broo...',
                sender: 'binu',
                sentByMe: true,
              );
            },
          ),
          Container(
            alignment: Alignment.bottomCenter,
            width: MediaQuery.of(context).size.width,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
              width: MediaQuery.of(context).size.width,
              color: Colors.grey[700],
              child: Row(children: [
                Expanded(
                    child: TextFormField(
                  controller: chatcontroller.messageController,
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                    hintText: "Send a message...",
                    hintStyle: TextStyle(color: Colors.white, fontSize: 16),
                    border: InputBorder.none,
                  ),
                )),
                const SizedBox(
                  width: 12,
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      color: Appcolors.primaryColor,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: const Center(
                        child: Icon(
                      Icons.send,
                      color: Colors.white,
                    )),
                  ),
                )
              ]),
            ),
          )
        ],
      ),
    );
  }
}
