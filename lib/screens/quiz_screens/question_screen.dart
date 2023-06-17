import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:genkid/config/utility/app_images.dart';
import 'package:genkid/cubit/Quizs_cubit/quizs_cubit.dart';
import 'package:genkid/widgets/answer_container.dart';
import 'package:sizer/sizer.dart';

class QuestionScreen extends StatelessWidget {
   QuestionScreen({Key? key}) : super(key: key);

   // final FlutterTts flutterTts=FlutterTts();
   //
   // speech(text)async{
   //   await flutterTts.setLanguage("en");
   //   await flutterTts.setPitch(1);
   //   await flutterTts.speak(text);
   //
   // }
  @override
  Widget build(BuildContext context) {

    return BlocConsumer<QuizsCubit, QuizsState>(
  listener: (context, state) {
    // TODO: implement listener
  },
  builder: (context, state) {
    List<String>? answers= [
      "${ context.read<QuizsCubit>().questionsModel.data[context.read<QuizsCubit>().index].option1}",
      "${context.read<QuizsCubit>().questionsModel.data[context.read<QuizsCubit>().index].option2}",
      "${ context.read<QuizsCubit>().questionsModel.data[context.read<QuizsCubit>().index].option3}",
      "${context.read<QuizsCubit>().questionsModel.data[context.read<QuizsCubit>().index].option4}"
    ];
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
                          border: Border.all(color: const Color(0xff7F5BFF), width: 1.3,strokeAlign:StrokeAlign.outside )),
                      child:  Text("${state is LoadingQuestionsState?"": context.read<QuizsCubit>().questionsModel.data[context.read<QuizsCubit>().index].questione}"),
                    ),
                    Positioned(
                      bottom: 4.h,
                      right: 4.w,
                      child: IconButton(onPressed: (){
                       // speech("hello");
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
