import 'package:flutter/material.dart';
import 'package:genkid/config/utility/app_images.dart';
import 'package:genkid/widgets/answer_container.dart';
import 'package:sizer/sizer.dart';

class QuestionScreen extends StatelessWidget {
  const QuestionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            child: Image.asset(
              AppImages.backGround,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: 10.h,
            left: 0,
            right: 0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                Container(
                  alignment: Alignment.center,
                  width: 80.w,
                  height: 25.h,
                  decoration: BoxDecoration(
                      boxShadow:[
                        BoxShadow(
                          color: Colors.white.withOpacity(0.1),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: const Offset(0, 0), // changes position of shadow
                        ),
                      ] ,
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(color: const Color(0xff7F5BFF), width: 1.3,strokeAlign:StrokeAlign.outside )),
                  child: const Text("Quistion"),
                ),
                SizedBox(height: 10.h,),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 15.w),
                  child: SizedBox(
                    height: 50.h,
                    child: ListView.builder(
                      itemCount: 4,
                        itemBuilder:(context, index) =>AnswerContainer(index: index) ,
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
