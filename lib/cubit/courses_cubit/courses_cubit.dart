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
  PlaylistsModel playlistsModel1=PlaylistsModel();
  PlaylistsModel playlistsModel2=PlaylistsModel();
  PlaylistsModel playlistsModel3=PlaylistsModel();
  CourseContentModel corseContentModel=CourseContentModel();

  List data1=[];
  List data2=[];
  List data3=[];


  void  getAllCourses()async {

    emit(LoadingCoursesState());
    await dioHelper.getData(
      url:"http://aresha11-001-site1.ftempurl.com/api/Playlists",

    ).then((value) {
      print(value.data[0]);
      playlistsModel=PlaylistsModel.fromJson(json: value.data);
      for(int i=0;i<=6;i++){
        if(value.data[i]["id"]<=2){
          Map<String,dynamic> map={
              "id":playlistsModel.data[i].id,
              "name":playlistsModel.data[i].name,
              "autherName":playlistsModel.data[i].autherName,
              "photo":playlistsModel.data[i].photo,
            };
          data1.add(map);

        }else if(value.data[i]["id"]<=7){
          Map<String,dynamic> map={
            "id":playlistsModel.data[i].id,
            "name":playlistsModel.data[i].name,
            "autherName":playlistsModel.data[i].autherName,
            "photo":playlistsModel.data[i].photo,
          };
          data2.add(map);
        }else{
          Map<String,dynamic> map={
            "id":playlistsModel.data[i].id,
            "name":playlistsModel.data[i].name,
            "autherName":playlistsModel.data[i].autherName,
            "photo":playlistsModel.data[i].photo,
          };
          data3.add(map);
        }
      }
      playlistsModel1=PlaylistsModel.fromJson(json: data1);
      playlistsModel2=PlaylistsModel.fromJson(json: data2);
      playlistsModel3=PlaylistsModel.fromJson(json: data3);

      print("first${playlistsModel1.data.length}");
      print("second${playlistsModel2.data.length}");
      print("third${playlistsModel3.data.length}");

      if (value.statusCode ==200) {
        emit(GetDataSuccessState());

        print(playlistsModel.data.length);

      }
      data1.clear();
      data2.clear();
      data3.clear();
    }).catchError((error) {
      emit(GetDataErrorState());
      throw error;
    });
  }







    getVideosById({required String playListId})async {
    //data.clear();
    emit(LoadingCoursesByIdState());
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
