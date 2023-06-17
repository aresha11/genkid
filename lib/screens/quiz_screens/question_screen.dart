import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:genkid/config/data/local/shared_preference.dart';
import 'package:genkid/config/utility/app_images.dart';
import 'package:genkid/config/utility/routes.dart';
import 'package:genkid/cubit/Quizs_cubit/quizs_cubit.dart';
import 'package:genkid/widgets/answer_container.dart';
import 'package:genkid/widgets/main_button.dart';
import 'package:sizer/sizer.dart';
import 'package:text_to_speech/text_to_speech.dart';

class QuestionScreen extends StatelessWidget {
   QuestionScreen({Key? key}) : super(key: key);
   TextToSpeech tts = TextToSpeech();

   void speak({required String question}) {
     tts.setVolume(1);
     tts.setRate(1);
     // if (languageCode != null) {
     //   tts.setLanguage(languageCode!);
     // }
     tts.setLanguage("en");
     tts.setPitch(1);
     tts.speak(question);
   }
  @override
  Widget build(BuildContext context) {

    return BlocConsumer<QuizsCubit, QuizsState>(
  listener: (context, state) {
    // TODO: implement listener
  },
  builder: (context, state) {

    List<String>? answers= [
      "${SharedPreference.get(key: "quizId").toString()!="null"? context.read<QuizsCubit>().questionsModel.data[context.read<QuizsCubit>().index].option1:""}",
      "${SharedPreference.get(key: "quizId").toString()!="null"?context.read<QuizsCubit>().questionsModel.data[context.read<QuizsCubit>().index].option2:""}",
      "${ SharedPreference.get(key: "quizId").toString()!="null"?context.read<QuizsCubit>().questionsModel.data[context.read<QuizsCubit>().index].option3:""}",
      "${SharedPreference.get(key: "quizId").toString()!="null"?context.read<QuizsCubit>().questionsModel.data[context.read<QuizsCubit>().index].option4:""}"
    ];
    return Scaffold(
      body: SharedPreference.get(key: "quizId").toString()=="null"?
        Stack(
          children: [
            Container(
              width: double.infinity,
              height: double.infinity,
              child: Image.asset(
                AppImages.backGround,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
             child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                 Center(
                  child:Text(SharedPreference.get(key: "next").toString()=="null"?"Start Your Course":"Watch Next Video",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 22,color: Colors.black),),
                ),
                SizedBox(
                  height: 10.h,
                ),
                MainButton(
                  color:Colors.white ,
                  onPressed: (){
                    Navigator.pushReplacementNamed(context, AppRoutes.coursesScreenRoute);
                  },
                  title: "Courses",
                )
              ],
      ),
       ),
          ],
        )
      :Stack(
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

                Stack(
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
                          border: Border.all(color: const Color(0xff7F5BFF), width: 1.3,strokeAlign:BorderSide.strokeAlignOutside)),
                      child:  Text("${state is LoadingQuestionsState?"": context.read<QuizsCubit>().questionsModel.data[context.read<QuizsCubit>().index].questione}"),
                    ),
                    Positioned(
                      bottom: 1.h,
                      right: 1.w,
                      child: IconButton(onPressed: (){
                        speak(question: context.read<QuizsCubit>().questionsModel.data[context.read<QuizsCubit>().index].questione.toString());
                      }, icon: Icon(Icons.mic_none)),
                    )
                  ],
                ),
                SizedBox(height: 10.h,),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 15.w),
                  child: SizedBox(
                    height: 50.h,
                    child: ListView.builder(
                      itemCount: 4,
                        itemBuilder:(context, index) =>AnswerContainer(
                          correct: context.read<QuizsCubit>().questionsModel.data[context.read<QuizsCubit>().index].correct.toString(),
                            index: index,
                          answers:state is LoadingQuestionsState?"":  answers[index],
                        ) ,
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  },
);
  }



}
