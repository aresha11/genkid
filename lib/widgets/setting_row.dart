import 'package:flutter/material.dart';
import 'package:genkid/widgets/primary_text.dart';
import 'package:sizer/sizer.dart';

class ProfileRow extends StatelessWidget {
   ProfileRow({Key? key, this.prefixIcon,required this.title,required this.onPress,this.needSuffix=true}) : super(key: key);

   bool needSuffix;
   IconData? prefixIcon;
   String title;
   @required Function onPress;
  @override
  Widget build(BuildContext context) {
    return needSuffix==true?
      Row(
      children: [
        CircleAvatar(
          radius: 30,
          child: Icon(prefixIcon),
        ),
        SizedBox(width: 4.w,),
        Expanded(child: PrimaryText(title: title, size: 18)),
        IconButton(onPressed: ()=>onPress(), icon:const Icon(Icons.arrow_forward)),
      ],
    ):Row(children: [
      Expanded(child: PrimaryText(title: title, size: 18)),
      IconButton(onPressed: ()=>onPress(), icon:const Icon(Icons.arrow_forward)),
    ],
    );
  }
}
