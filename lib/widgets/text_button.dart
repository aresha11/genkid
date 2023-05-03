import 'package:flutter/material.dart';

class ButtonText extends StatelessWidget {
  VoidCallback onPress;
  String title;

   ButtonText({Key? key,required this.onPress,required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onPress ,
        child: Text(title));
  }
}
