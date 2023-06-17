import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:genkid/config/data/shared/dio_helper.dart';
import 'package:genkid/config/models/course_content_model.dart';
import 'package:genkid/config/models/course_content_model.dart';


import 'package:meta/meta.dart';

import '../../config/models/playlists_model.dart';

part 'courses_state.dart';

class CoursesCubit extends Cubit<CoursesState> {

  var currentVideo;
  CoursesCubit() : super(CoursesInitial());


  DioHelper dioHelper=DioHelper();

  PlaylistsModel playlistsModel=PlaylistsModel();
  CourseContentModel corseContentModel=CourseContentModel();

  List<PlaylistsModel> data=[];


  void  getAllCourses()async {
    //data.clear();
    emit(LoadingCoursesState());
    await dioHelper.getData(
      url:"http://aresha11-001-site1.ftempurl.com/api/Playlists",

    ).then((value) {
      if (value.statusCode ==200) {
        emit(GetDataSuccessState());
        playlistsModel=PlaylistsModel.fromJson(json: value.data);
        print(playlistsModel.data.length);
        print(playlistsModel.data[0].photo);
      }
    }).catchError((error) {
      emit(GetDataErrorState());
      throw error;
    });
  }
    getCourseById({required String playListId})async {
    //data.clear();
    emit(LoadingCoursesState());
    await dioHelper.getData(
      url:"http://aresha11-001-site1.ftempurl.com/api/Videos/GetByPlaylistID/$playListId",

    ).then((value) {
      if (value.statusCode ==200) {
        emit(GetDataSuccessState());
        corseContentModel=CourseContentModel.fromJson(json: value.data);

      }
    }).catchError((error) {
      emit(GetDataErrorState());
      throw error;
    });
  }






}
