import 'package:bloc/bloc.dart';
import 'package:genkid/config/models/posts_model.dart';
import 'package:meta/meta.dart';

import '../../config/data/shared/dio_helper.dart';

part 'posts_state.dart';

class PostsCubit extends Cubit<PostsState> {
  PostsCubit() : super(PostsInitial());

  DioHelper  dioHelper= DioHelper();

  PostsModel postsModel=PostsModel();



  addPost({required String userName,required String post}) async {
    emit(LoadingAddPostState());
    await dioHelper.postData(
      url: "http://aresha11-001-site1.ftempurl.com/api/Codes",
      data: {
        "userName":  userName,
        "post": post ,
      }
    ).then((value) {
      if (value.statusCode == 200) {
        print("true");
        emit(AddPostSuccessState());
      }
    }).catchError((error) {
      emit(AddPostFailedState());
      throw error;
    });
  }




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







}
