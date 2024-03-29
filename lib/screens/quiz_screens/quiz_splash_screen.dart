import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:genkid/config/utility/app_images.dart';
import 'package:genkid/config/utility/routes.dart';
import 'package:genkid/screens/quiz_screens/question_screen.dart';
import 'package:sizer/sizer.dart';

import '../../cubit/Quizs_cubit/quizs_cubit.dart';

class QuizSplashScreen extends StatefulWidget {
  const QuizSplashScreen({Key? key}) : super(key: key);

  @override
  State<QuizSplashScreen> createState() => _QuizSplashScreenState();
}

class _QuizSplashScreenState extends State<QuizSplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    //context.read<QuizsCubit>().getQuestionsBySubgroupId();
    super.initState();
  }

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

                      // Navigator.pushReplacementNamed(context, AppRoutes.questionScreenRoute);
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => QuestionScreen(),));
                    },

            ),
                ),

        ],
      ),
    );
  }
}
