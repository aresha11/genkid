import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:genkid/config/data/local/shared_preference.dart';
import 'package:genkid/config/data/shared/dio_helper.dart';
import 'package:meta/meta.dart';

import '../../config/models/playlists_model.dart';

part 'courses_state.dart';

class CoursesCubit extends Cubit<CoursesState> {
  CoursesCubit() : super(CoursesInitial());


  DioHelper dioHelper=DioHelper();

  PlaylistsModel playlistsModel=PlaylistsModel();

  List<PlaylistsModel> data=[];


  void  getAllCourses()async {
    //data.clear();
    emit(LoadingDataState());
    await dioHelper.getData(
      url:"http://osama121220-001-site1.btempurl.com/api/Playlists",

    ).then((value) {
      if (value.statusCode ==200) {
        emit(GetDataSuccessState());
        playlistsModel=PlaylistsModel.fromJson(json: value.data);
        print( playlistsModel.data.length);
        // value.data.forEach((e){
        //   playlistsModel=PlaylistsModel.fromJson(e);
        //   print( playlistsModel.id);
        //  // data.add(e);
        //   //print(data[0].photo);
        // });
       // print(data[0]["id"]);
      //  print(data[0].photo);
        // try{
        //   for(int i=0;i<=0;i++){
        //     data.add(value.data[i]);
        //     print(data[0].photo);
        //   }
        // }catch(e){
        //   print(data[0].photo);
        //   print(e);
        // }
       // print(data[0].photo);
      }
    }).catchError((error) {
      emit(GetDataErrorState());
      throw error;
    });
  }






}
