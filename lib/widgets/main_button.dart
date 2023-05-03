import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class MainButton extends StatefulWidget {

  String? title;
  VoidCallback? onPressed;
  Color? color;


  MainButton
      ({
    super.key,
    this.title,
    this.onPressed,
    this.color
  });
  @override
  State<MainButton> createState() => _MainButtonState();
}

class _MainButtonState extends State<MainButton> {
  @override
  Widget build(BuildContext context) {
    return  Container(
       decoration: BoxDecoration(
         borderRadius:BorderRadius.circular(20.h) ,
           //borderRadius: BorderRadius.all(Radius.circular(20.0),
        gradient: const LinearGradient(
          colors: [
            Color(0xff7F5BFF),
            Color(0xff4624C2),
          ]
       ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.4),
            spreadRadius: 2,
            blurRadius: 8,
            offset: Offset(4, 4),
          )
        ]
    ),
      child: MaterialButton(
        color: Colors.transparent,
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20.0))),
        height: 35.sp,
        minWidth:double.infinity,
        onPressed: widget.onPressed,
        child: Text("${widget.title}",style: TextStyle(color: Colors.white),),

      ),
    );
  }
}
