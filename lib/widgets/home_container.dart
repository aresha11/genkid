import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:genkid/config/utility/routes.dart';
import 'package:genkid/cubit/Quizs_cubit/quizs_cubit.dart';
import 'package:genkid/cubit/courses_cubit/courses_cubit.dart';
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
        // if(nextScreen==AppRoutes.quizSplashScreenRoute){
        //   context.read<QuizsCubit>().getQuestionsBySubgroupId();
        //   if(nextScreen==AppRoutes.coursesScreenRoute){
        //   //context.read<CoursesCubit>().getCourseById();
        //   context.read<CoursesCubit>().getAllCourses();
        // }
      // }
      },
      child: Container(
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              child: Image.asset(AppImages.backGroundContainer,fit: BoxFit.fill,height: 37.h),
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
