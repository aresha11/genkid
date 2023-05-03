import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../config/utility/app_images.dart';
class HomeContainer extends StatelessWidget {
  HomeContainer({Key? key,required this.imageUrl,required this.primaryTitle,required this.secondTitle,required this.nextScreen}) : super(key: key);

  String imageUrl;
  String primaryTitle;
  String secondTitle;
  String nextScreen;


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:(){
        Navigator.pushNamed(context,nextScreen );
      } ,
      child: Container(
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              child: Image.asset(AppImages.backGroundContainer,fit: BoxFit.fill),
            ),
            Container(
              height: 31.h,
              width: double.infinity,
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                  color: Color(0xffbab0d5),
                  borderRadius: BorderRadius.all(Radius.circular(30))
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset(imageUrl,width: 100,height: 100,),
                  Text(primaryTitle,style: const TextStyle(fontSize: 20,fontWeight: FontWeight.w700,color: Colors.black),),
                  Text(secondTitle,style: const TextStyle(fontSize: 14,fontWeight: FontWeight.w500,color: Colors.black),maxLines: 5),


                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
