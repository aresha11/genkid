import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CustumAppBar extends StatelessWidget {
  /// Parameters
  final String title;
  Color? text_color;
  CustumAppBar(this.title,{Key? key,this.text_color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      elevation: 0,
      backgroundColor: Color(0xffC6AEEA),
      title: Text(title,style:TextStyle(fontSize: 17.sp ),),
    );
  }
}
