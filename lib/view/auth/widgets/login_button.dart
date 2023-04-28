import 'package:flutter/material.dart';

import '../../../const/colors.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({
    super.key,required this.onPressed, this.text
  });

 final void Function()? onPressed;
 final String? text;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          elevation: 5,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          minimumSize: Size(MediaQuery.of(context).size.width * 0.7, 50),
          backgroundColor: Appcolors.primaryColor),
      onPressed: onPressed,
      child:  Text(
       text!,
        style: const TextStyle(fontSize: 17),
      ),
    );
  }
}
