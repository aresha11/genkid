import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:genkid/config/data/local/shared_preference.dart';
import 'package:genkid/config/data/shared/dio_helper.dart';
import 'package:meta/meta.dart';

part 'courses_state.dart';

class CoursesCubit extends Cubit<CoursesState> {
  CoursesCubit() : super(CoursesInitial());


  DioHelper dioHelper=DioHelper();


  void  getAllJobs({index})async {
    emit(LoadingDataState());
    await dioHelper.getData(
      url:"http://osama121220-001-site1.btempurl.com/api/Playlists",

    ).then((value) {
      if (value.statusCode ==200) {
        emit(GetDataSuccessState());
        print(value.data[0]["autherName"]);
        SharedPreference.put(key: "photo", value: value.data[0]["photo"]);
      }
    }).catchError((error) {
      if (kDebugMode) {
        print(error);
      }
      emit(GetDataErrorState());
    });
  }






}
