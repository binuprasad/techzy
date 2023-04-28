import 'package:flutter/material.dart';

import '../../../const/colors.dart';

class TextformfieldWidget extends StatelessWidget {
  const TextformfieldWidget({
    super.key,
    required this.hintText,
    required this.icon,
    required this.controller,
  });
  final String hintText;
  final IconData icon;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          CircleAvatar(
              backgroundColor: Appcolors.primaryColor,
              radius: 30,
              child: Icon(icon)),
          const SizedBox(
            width: 5,
          ),
          Expanded(
            child: TextFormField(
              controller: controller,
              decoration: InputDecoration(
                  hintText: hintText, border: const OutlineInputBorder()),
            ),
          ),
        ],
      ),
    );
  }
}
