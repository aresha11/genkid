import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:genkid/config/models/posts_model.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
import '../../config/data/shared/dio_helper.dart';

part 'posts_state.dart';

class PostsCubit extends Cubit<PostsState> {
  PostsCubit() : super(PostsInitial());

  DioHelper  dioHelper= DioHelper();

  PostsModel postsModel=PostsModel();



  // addPost({required String userName,required String post}) async {
  //   emit(LoadingAddPostState());
  //   print("ssss");
  //   await dioHelper.post(
  //     url: "http://aresha11-001-site1.ftempurl.com/api/Codes",
  //     data: {
  //       "userName":  "mohamed",
  //       "post": " <p>This is a styled paragraph.</p>" ,
  //     }
  //   ).then((value) {
  //      if (value.statusCode == 200) {
  //        print("true");
  //        print(value);
  //       emit(AddPostSuccessState());
  //      }
  //   }).catchError((error) {
  //     emit(AddPostFailedState());
  //     throw error;
  //   });
  // }
  //



  getPosts() async {
    emit(LoadingGetPostState());
    await dioHelper.getData(
      url: "http://aresha11-001-site1.ftempurl.com/api/Codes",
    ).then((value) {
      if (value.statusCode == 200) {
        postsModel=PostsModel.fromJson(json:value.data);
        emit(GetPostSuccessState());


      }
    }).catchError((error) {
      emit(GetPostFailedState());
      throw error;
    });
  }
 // void gettPosts()  {
 //    emit(LoadingGetPostState());
 //     dioHelper.post(
 //      url: "http://aresha11-001-site1.ftempurl.com/api/Codes",
 //      data: {
 //    "userName":  "mohamed",
 //    "post": " hello" ,
 //    },
 //    ).then((value) {
 //      print("khra");
 //      if (value.statusCode == 200) {
 //        print("ddddddddd");
 //        print(value.data);
 //        emit(GetPostSuccessState());
 //
 //      }
 //    }).catchError((error) {
 //      print(error);
 //      emit(GetPostFailedState());
 //      throw error;
 //    });
 //  }




  addPost({required String userName,required String post}) async {
    emit(LoadingGetPostState());
    String url = 'http://aresha11-001-site1.ftempurl.com/api/Codes';
    http.Response response = await http
        .post(Uri.parse(url),
      body: {
        "userName":userName,
        "post":post ,
      },)
        .then(
          (value) {
            print(url);
          emit(GetPostSuccessState());
          print(url);
       print("Dd");
       print(value.statusCode);
       print(value.body);
        return value;
      },
    ).catchError((onError) {
      emit(GetPostFailedState());
      throw onError;
    });
  }



}
