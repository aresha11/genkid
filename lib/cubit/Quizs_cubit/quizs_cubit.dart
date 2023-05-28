import 'package:bloc/bloc.dart';
import 'package:genkid/config/data/shared/dio_helper.dart';
import 'package:genkid/config/models/questions_model.dart';
import 'package:meta/meta.dart';

import '../../config/models/quiz_model.dart';
import '../../config/models/subgroups_model.dart';

part 'quizs_state.dart';

class QuizsCubit extends Cubit<QuizsState> {
  QuizsCubit() : super(QuizsInitial());




  DioHelper dioHelper=DioHelper();

  QuizModel quizModel=QuizModel();

  SubGroupsModel subGroupsModel=SubGroupsModel();

  QuestionsModel questionsModel=QuestionsModel();


  void  getAllQuizs()async {
    //data.clear();
    emit(LoadingQuizState());
    await dioHelper.getData(
      url: "http://osama121220-001-site1.btempurl.com/api/Quizs",
    ).then((value) {
      if (value.statusCode == 200) {
        emit(GetQuizSuccessState());
        quizModel = QuizModel.fromJson(json: value.data);
        print(quizModel.data.length);

      }
    }).catchError((error) {
      emit(GetQuizFilState());
      throw error;
    });
  }


  void  getAllSubGroups()async {
    //data.clear();
    emit(LoadingSubgroupsState());
    await dioHelper.getData(
      url: "http://osama121220-001-site1.btempurl.com/api/Subgroups",
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


  void  getAllQuestions()async {
    //data.clear();
    emit(LoadingQuestionsState());
    await dioHelper.getData(
      url: "http://osama121220-001-site1.btempurl.com/api/Questions",
    ).then((value) {
      if (value.statusCode == 200) {
        emit(GetQuestionsSuccessState());
            questionsModel = QuestionsModel.fromJson(json: value.data);
            print(questionsModel.data.length);

      }
    }).catchError((error) {
      emit(GetQuestionsFilState());
      throw error;
    });
  }


}
