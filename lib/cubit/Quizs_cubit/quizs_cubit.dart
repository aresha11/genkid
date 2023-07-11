import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:genkid/config/data/local/shared_preference.dart';
import 'package:genkid/config/data/shared/dio_helper.dart';
import 'package:genkid/config/models/questions_model.dart';
import 'package:meta/meta.dart';

import '../../config/models/quiz_model.dart';
import '../../config/models/subgroups_model.dart';
import '../../screens/quiz_screens/quiz_finish.dart';

part 'quizs_state.dart';

class QuizsCubit extends Cubit<QuizsState> {
  QuizsCubit() : super(QuizsInitial());


  DioHelper dioHelper = DioHelper();

  QuizModel quizModel = QuizModel();

  SubGroupsModel subGroupsModel = SubGroupsModel();

  QuestionsModel questionsModel = QuestionsModel();


  int index = 0;

  //bool quizFinish=false;

  int videoId=SharedPreference.get(key: "videoId").toString()=="null"?0:SharedPreference.get(key: "videoId");

  changVideoId(){
  videoId=SharedPreference.get(key: "videoId").toString()=="null"?0:SharedPreference.get(key: "videoId");
  emit(ChangeVideoIdSuccessState());
  }


  changeIndex(context) {
    if (index < questionsModel.data.length - 1) {
      index = index + 1;
      emit(ChangeIndexSuccessState());
    } else {
      //quizFinish=true;
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const QuizFinish(),));
      if(SharedPreference.get(key: "increaseVideoIndex")==true){
        SharedPreference.put(key: "videoId", value:SharedPreference.get(key: "videoId").toString()=="null"?1:SharedPreference.get(key: "videoId")+1 );
      }
      SharedPreference.removeData(key: "quiz");
      SharedPreference.put(key: "next", value: "true");
      index=0;
    }
  }

  void getAllSubGroups() async {
    //data.clear();
    emit(LoadingSubgroupsState());
    await dioHelper.getData(
      url: "http://aresha11-001-site1.ftempurl.com/api/Subgroups",
    ).then((value) {
      if (value.statusCode == 200) {
        emit(GetSubgroupsSuccessState());
        subGroupsModel = SubGroupsModel.fromJson(json: value.data);
        print(subGroupsModel.data.length);
      }
    }).catchError((error) {
      emit(GetSubgroupsFilState());
      throw error;
    });
  }


  void getQuestionsBySubgroupId({required String subgroupId}) async {
    print( SharedPreference.get(key: "htmlQuizId"));
    print( SharedPreference.get(key: "scratchQuizId"));
    print(SharedPreference.get(key: "quizType"));
    //data.clear();
    emit(LoadingQuestionsState());
    await dioHelper.getData(
      url: "http://aresha11-001-site1.ftempurl.com/api/Questions/GetBySubgroubId/$subgroupId",
    ).then((value) {
      print(SharedPreference.get(key: "htmlQuizId"));
      if (value.statusCode == 200) {
        emit(GetQuestionsSuccessState());
         questionsModel = QuestionsModel.fromJson(json: value.data);
         print(questionsModel.data[0].option1);
      }
    }).catchError((error) {
      emit(GetQuestionsFilState());
      throw error;
    });
  }


}
