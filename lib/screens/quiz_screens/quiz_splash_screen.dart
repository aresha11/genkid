import 'package:flutter/material.dart';
import 'package:genkid/config/utility/app_images.dart';
import 'package:genkid/config/utility/routes.dart';
import 'package:sizer/sizer.dart';

class QuizSplashScreen extends StatelessWidget {
  const QuizSplashScreen({Key? key}) : super(key: key);

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
                  top: 33.h,
                  left: 0,
                  right: 0,
                  child: Image.asset(
                    AppImages.quiz,
                    height: 40.h,
                    width: 40.h,
                  ),
                ),
                Positioned(
                  top: 90.h,
                  left: 0,
                  right: 0,
                  child: IconButton(
                    icon: const Icon(Icons.arrow_forward_ios_outlined),
                    onPressed: () {
                      Navigator.pushNamed(context, AppRoutes.questionScreenRoute);
                    },

            ),
                ),

        ],
      ),
    );
  }
}
